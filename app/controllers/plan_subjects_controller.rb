class PlanSubjectsController < ApplicationController
  before_action :set_plan_subject, only: [:show, :edit, :update, :destroy]

  # GET /plan_subjects
  # GET /plan_subjects.json
  def index
    @plan_subjects = PlanSubject.all
  end

  # GET /plan_subjects/1
  # GET /plan_subjects/1.json
  def show
  end

  # GET /plan_subjects/new
  def new
    @plan_subject = PlanSubject.new
  end

  # GET /plan_subjects/1/edit
  def edit
  end

  # POST /plan_subjects
  # POST /plan_subjects.json
  def create
    @plan_subject = PlanSubject.new(plan_subject_params)

    respond_to do |format|
      if @plan_subject.save
        format.html { redirect_to @plan_subject, notice: 'Plan subject was successfully created.' }
        format.json { render :show, status: :created, location: @plan_subject }
      else
        format.html { render :new }
        format.json { render json: @plan_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_subjects/1
  # PATCH/PUT /plan_subjects/1.json
  def update
    respond_to do |format|
      if @plan_subject.update(plan_subject_params)
        format.html { redirect_to @plan_subject, notice: 'Plan subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan_subject }
      else
        format.html { render :edit }
        format.json { render json: @plan_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_subjects/1
  # DELETE /plan_subjects/1.json
  def destroy
    @plan_subject.destroy
    respond_to do |format|
      format.html { redirect_to plan_subjects_url, notice: 'Plan subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_subject
      @plan_subject = PlanSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_subject_params
      params.require(:plan_subject).permit(:plan_id, :subject_id)
    end
end
