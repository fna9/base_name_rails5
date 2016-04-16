class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    if params.has_key?(:teacher) and params[:teacher].has_key?(:subjects)
      @ts = params[:teacher][:subjects].map{ |ts| ts.to_i } - [0]
    end    
    if @teacher.save
      if @ts.kind_of?(Array)
        @teacher.subject_teachers.delete_all
        @ts.each do |gr_id|
          SubjectTeacher.create(subject_id: gr_id.to_i, teacher: @teacher)
        end
      end
    end
   

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Преподаватель успешно создан.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    if params.has_key?(:teacher) and params[:teacher].has_key?(:subjects)
      @ts = params[:teacher][:subject].map{ |ts| ts.to_i } - [0]
    end    
    if @teacher.update(teacher_params)
      if @ts.kind_of?(Array)
        @teacher.subject_teachers.delete_all
        @ts.each do |gr_id|
          SubjectTeacher.create(subject_id: gr_id.to_i, teacher: @teacher)
        end
      end
    end
  
    respond_to do |format|
      if @teacher.errors.size == 0
        format.html { redirect_to @teacher, notice: 'Преподаватель успешно изменен.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Преподаватель удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:last_name, :second_name, :first_name, :degree, :rank, :position, :b_date)
    end
end
