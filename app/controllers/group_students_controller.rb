class GroupStudentsController < ApplicationController
  before_action :set_group_student, only: [:show, :edit, :update, :destroy]

  # GET /group_students
  # GET /group_students.json
  def index
    @group_students = GroupStudent.all
  end

  # GET /group_students/1
  # GET /group_students/1.json
  def show
  end

  # GET /group_students/new
  def new
    @group_student = GroupStudent.new
  end

  # GET /group_students/1/edit
  def edit
  end

  # POST /group_students
  # POST /group_students.json
  def create
    @group_student = GroupStudent.new(group_student_params)

    respond_to do |format|
      if @group_student.save
        format.html { redirect_to @group_student, notice: 'Group student was successfully created.' }
        format.json { render :show, status: :created, location: @group_student }
      else
        format.html { render :new }
        format.json { render json: @group_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_students/1
  # PATCH/PUT /group_students/1.json
  def update
    respond_to do |format|
      if @group_student.update(group_student_params)
        format.html { redirect_to @group_student, notice: 'Group student was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_student }
      else
        format.html { render :edit }
        format.json { render json: @group_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_students/1
  # DELETE /group_students/1.json
  def destroy
    @group_student.destroy
    respond_to do |format|
      format.html { redirect_to group_students_url, notice: 'Group student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_student
      @group_student = GroupStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_student_params
      params.require(:group_student).permit(:group_id, :student_id)
    end
end
