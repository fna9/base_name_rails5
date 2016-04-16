class MessagerUsersController < ApplicationController
  before_action :set_messager_user, only: [:show, :edit, :update, :destroy]

  # GET /messager_users
  # GET /messager_users.json
  def index
    @messager_users = MessagerUser.all
  end

  # GET /messager_users/1
  # GET /messager_users/1.json
  def show
  end

  # GET /messager_users/new
  def new
    @messager_user = MessagerUser.new
  end

  # GET /messager_users/1/edit
  def edit
  end

  # POST /messager_users
  # POST /messager_users.json
  def create
    @messager_user = MessagerUser.new(messager_user_params)

    respond_to do |format|
      if @messager_user.save
        format.html { redirect_to @messager_user, notice: 'Messager user was successfully created.' }
        format.json { render :show, status: :created, location: @messager_user }
      else
        format.html { render :new }
        format.json { render json: @messager_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messager_users/1
  # PATCH/PUT /messager_users/1.json
  def update
    respond_to do |format|
      if @messager_user.update(messager_user_params)
        format.html { redirect_to @messager_user, notice: 'Messager user was successfully updated.' }
        format.json { render :show, status: :ok, location: @messager_user }
      else
        format.html { render :edit }
        format.json { render json: @messager_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messager_users/1
  # DELETE /messager_users/1.json
  def destroy
    @messager_user.destroy
    respond_to do |format|
      format.html { redirect_to messager_users_url, notice: 'Messager user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messager_user
      @messager_user = MessagerUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messager_user_params
      params.require(:messager_user).permit(:messager_id, :user_id)
    end
end
