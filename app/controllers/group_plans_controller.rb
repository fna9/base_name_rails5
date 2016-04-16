class GroupPlansController < ApplicationController
  before_action :set_group_plan, only: [:show, :edit, :update, :destroy]

  # GET /group_plans
  # GET /group_plans.json
  def index
    @group_plans = GroupPlan.all
  end

  # GET /group_plans/1
  # GET /group_plans/1.json
  def show
  end

  # GET /group_plans/new
  def new
    @group_plan = GroupPlan.new
  end

  # GET /group_plans/1/edit
  def edit
  end

  # POST /group_plans
  # POST /group_plans.json
  def create
    @group_plan = GroupPlan.new(group_plan_params)

    respond_to do |format|
      if @group_plan.save
        format.html { redirect_to @group_plan, notice: 'Group plan was successfully created.' }
        format.json { render :show, status: :created, location: @group_plan }
      else
        format.html { render :new }
        format.json { render json: @group_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_plans/1
  # PATCH/PUT /group_plans/1.json
  def update
    respond_to do |format|
      if @group_plan.update(group_plan_params)
        format.html { redirect_to @group_plan, notice: 'Group plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_plan }
      else
        format.html { render :edit }
        format.json { render json: @group_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_plans/1
  # DELETE /group_plans/1.json
  def destroy
    @group_plan.destroy
    respond_to do |format|
      format.html { redirect_to group_plans_url, notice: 'Group plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_plan
      @group_plan = GroupPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_plan_params
      params[:group_plan]
    end
end
