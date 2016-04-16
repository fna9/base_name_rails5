class AfileMessagersController < ApplicationController
  before_action :set_afile_messager, only: [:show, :edit, :update, :destroy]

  # GET /afile_messagers
  # GET /afile_messagers.json
  def index
    @afile_messagers = AfileMessager.all
  end

  # GET /afile_messagers/1
  # GET /afile_messagers/1.json
  def show
  end

  # GET /afile_messagers/new
  def new
    @afile_messager = AfileMessager.new
  end

  # GET /afile_messagers/1/edit
  def edit
  end

  # POST /afile_messagers
  # POST /afile_messagers.json
  def create
    @afile_messager = AfileMessager.new(afile_messager_params)

    respond_to do |format|
      if @afile_messager.save
        format.html { redirect_to @afile_messager, notice: 'Afile messager was successfully created.' }
        format.json { render :show, status: :created, location: @afile_messager }
      else
        format.html { render :new }
        format.json { render json: @afile_messager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /afile_messagers/1
  # PATCH/PUT /afile_messagers/1.json
  def update
    respond_to do |format|
      if @afile_messager.update(afile_messager_params)
        format.html { redirect_to @afile_messager, notice: 'Afile messager was successfully updated.' }
        format.json { render :show, status: :ok, location: @afile_messager }
      else
        format.html { render :edit }
        format.json { render json: @afile_messager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /afile_messagers/1
  # DELETE /afile_messagers/1.json
  def destroy
    @afile_messager.destroy
    respond_to do |format|
      format.html { redirect_to afile_messagers_url, notice: 'Afile messager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_afile_messager
      @afile_messager = AfileMessager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def afile_messager_params
      params.require(:afile_messager).permit(:afile_id, :messager_id)
    end
end
