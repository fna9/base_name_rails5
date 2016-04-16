class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :get_photo, :show_photo]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    #@groups = Group.where(:student_id=@student)
  end

  def show_photo
    render(layout: 'easy_layout')
  end

  def get_photo
    type = :medium
    type = params['type'] if params.has_key?(:type)
    photo = @student.avatar.path(type)
    send_file photo
  end

  # GET /students/1
  # GET /students/1.json
  def show
    if @current_role_user.try('is_teacher?')
      render('show')
    else
      render('show_for_students')
    end 
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params) 
    if params.has_key?(:student) and params[:student].has_key?(:groups)
      @sg = params[:student][:groups].map{ |sg| sg.to_i } - [0]
    end    
    if @student.save
      if @sg.kind_of?(Array)
        @student.group_students.delete_all
        @sg.each do |gr_id|
          GroupStudent.create(group_id: gr_id.to_i, student: @student)
        end
      end
    end
   

    respond_to do |format|
      if @student.errors.size == 0
        format.html { redirect_to @student, notice: 'Студент успешно создан.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if params.has_key?(:student) and params[:student].has_key?(:groups)
      @sg = params[:student][:groups].map{ |sg| sg.to_i } - [0]
    end    
    if @student.update(student_params)
      if @sg.kind_of?(Array)
        @student.group_students.delete_all
        @sg.each do |gr_id|
          GroupStudent.create(group_id: gr_id.to_i, student: @student)
        end
      end
    end
  
    respond_to do |format|
      if @student.errors.size == 0
        format.html { redirect_to @student, notice: 'Информация о студенте успешно изменена.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Студент удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:last_name, :first_name, :second_name, :b_date, :passport_id, :passport_series, :avatar)
    end
end
