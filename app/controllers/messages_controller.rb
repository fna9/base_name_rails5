class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params) 
    if params.has_key?(:message) and params[:message].has_key?(:users)
      @mu = params[:message][:user].map{ |mu| sg.to_i } - [0]
    end    
    if @message.save
      if @mu.kind_of?(Array)
        @message.message_users.delete_all
        @mu.each do |mu_id|
          MessegerUser.create(user_id: mu_id.to_i, message: @message)
        end
      end
    end
   

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Сообщение было успешно создано.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    if params.has_key?(:message) and params[:message].has_key?(:users)
      @mu = params[:message][:users].map{ |mu| mu.to_i } - [0]
    end    
    if @message.update(message_params)
      if @mu.kind_of?(Array)
        @message.message_users.delete_all
        @sg.each do |gr_id|
          MessegerUser.create(user_id: mu_id.to_i, message: @message)
        end
      end
    end
  
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Сообщение было успешно обновлено.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Сообщение было успешно удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:header, :text, :talk_id, :user_id)
    end
end
