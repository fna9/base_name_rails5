class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    if @current_role_user.try('is_teacher?')
      render('show')
    else
      render('show_for_students')
    end 
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    if params.has_key?(:subject) and params[:subject].has_key?(:teachers)
      @st = params[:subject][:teachers].map{ |st| st.to_i } - [0]
    end    
    if @subject.save
      if @st.kind_of?(Array)
        @subject.subject_teachers.delete_all
        @st.each do |gr_id|
          SubjectTeacher.create(teacher_id: gr_id.to_i, subject: @subject)
        end
      end
    end
   

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Дисциплина успешно создан' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    if params.has_key?(:subject) and params[:subject].has_key?(:teachers)
      @st = params[:subject][:teachers].map{ |st| st.to_i } - [0]
    end    
    if @subject.update(subject_params)
      if @st.kind_of?(Array)
        @subject.subject_teachers.delete_all
        @st.each do |gr_id|
          SubjectTeacher.create(teacher_id: gr_id.to_i, subject: @subject)
        end
      end
    end
  
    respond_to do |format|
      if @subject.errors.size == 0
        format.html { redirect_to @subject, notice: 'Дисциплина успешно изменена.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Дисциплина успено удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:title, :s_type, :type_of_reporting)
    end
end
