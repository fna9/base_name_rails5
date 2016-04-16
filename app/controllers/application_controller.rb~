class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_current_user
  before_action :load_current_role_user
  before_action :load_current_university
  before_action :check_app_auth
  

  private
  def not_authenticated
    redirect_to login_path, alert: "Сначала войдите в систему!"
  end

  def load_current_user
    @current_user = current_user
  end

  def check_app_auth
	#return true
    render 'access_denied' unless @current_role_user.try(:is_admin?)
  end

  def admin_permission
    unless @current_client.try(:admin?)
      flash[:danger]="Недостаточно прав для просмотра страницы"
      redirect_to root_path
    end
  end

  def load_current_university
    if params.has_key?(:current_university_id)
      @current_university = University.find(params[:current_university_id])
      session[:current_university_id] = @current_university.id
    elsif session.has_key?(:current_university_id)
      @current_university = University.find(session[:current_university_id])
    else
      @current_university = University.first
    end
  end
 
  def load_current_role_user
    if params.has_key?(:current_role_user_id)
      @current_role_user = RoleUser.find(params[:current_role_user_id])
      session[:current_role_user_id] = @current_role_user.id
    elsif session.has_key?(:current_role_user_id)
      @current_role_user = RoleUser.find(session[:current_role_user_id])
    elsif @current_user.present?
      @current_role_user = @current_user.role_users.first
    end
  end
end


