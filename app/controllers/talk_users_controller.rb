class TalkUsersController < ApplicationController
  before_action :set_talk_user, only: [:show, :edit, :update, :destroy]

  # GET /talk_users
  # GET /talk_users.json
  def index
    @talk_users = TalkUser.all
  end

  # GET /talk_users/1
  # GET /talk_users/1.json
  def show
  end

  # GET /talk_users/new
  def new
    @talk_user = TalkUser.new
  end

  # GET /talk_users/1/edit
  def edit
  end

  # POST /talk_users
  # POST /talk_users.json
  def create
    @talk_user = TalkUser.new(talk_user_params)

    respond_to do |format|
      if @talk_user.save
        format.html { redirect_to @talk_user, notice: 'Talk user was successfully created.' }
        format.json { render :show, status: :created, location: @talk_user }
      else
        format.html { render :new }
        format.json { render json: @talk_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talk_users/1
  # PATCH/PUT /talk_users/1.json
  def update
    respond_to do |format|
      if @talk_user.update(talk_user_params)
        format.html { redirect_to @talk_user, notice: 'Talk user was successfully updated.' }
        format.json { render :show, status: :ok, location: @talk_user }
      else
        format.html { render :edit }
        format.json { render json: @talk_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talk_users/1
  # DELETE /talk_users/1.json
  def destroy
    @talk_user.destroy
    respond_to do |format|
      format.html { redirect_to talk_users_url, notice: 'Talk user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk_user
      @talk_user = TalkUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talk_user_params
      params.require(:talk_user).permit(:user_id, :talk_id)
    end
end
