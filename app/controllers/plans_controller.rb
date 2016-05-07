class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    
    if params.has_key?(:plan) and params[:plan].has_key?(:groups)
      @sg = params[:plan][:group].map{ |sg| sg.to_i } - [0]
    end    
    if params.has_key?(:subject)
      @sg = params[:subject].map{ |ss| ss.to_i} - [0]
    end
   # raise @sg.inspect
    if @plan.save
      if @sg.kind_of?(Array)
        @plan.group_plans.delete_all
        @sg.each do |gr_id|
          GroupPlan.create(group_id: gr_id.to_i, plan: @plan)
        end
      end
    end

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end


  def add_one_more
    @object = params[:object]
    if params[:object] == 'subject'
      @subject = Subject.new
    elsif params[:object] == 'group'
      @group = Group.new
    end
    @i = params[:i].to_i
    respond_to do |format|
      format.js
    end
  end
  
  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    if params.has_key?(:plan) and params[:plan].has_key?(:groups)
      @sg = params[:plan][:groups].map{ |sg| sg.to_i } - [0]
    end    
    if params.has_key?(:subject)
      @ss = params[:subject].map{ |ss| ss.to_i} - [0]
    end

    if @plan.update(plan_params)
      if @sg.kind_of?(Array)
        @plan.group_plans.delete_all
        @sg.each do |gr_id|
          GroupPlan.create(group_id: gr_id.to_i, plan: @plan)
        end
      end
      if @ss.kind_of?(Array)
        @plan.plan_subjects.delete_all
        @ss.each do |ss_id|
          PlanSubject.create(subject_id: ss_id.to_i, plan: @plan)
        end
      end
    end
  
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:code, :title, :level, :form_of_study, :training_period_start, :training_period_finish, :groups_id, :university_id)
    end
end
