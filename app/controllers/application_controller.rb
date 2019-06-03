class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def auth
    respond_to do |format|
      format.html do
        raise "NotAuthorized"
      end

      format.json do
        render json: { "error": "NotAuthorized", status: 401 }, status: 401
      end
    end if auth_bussiness(params)
  end

  private

  def auth_bussiness params
    params[:token].blank? or params[:token] != ENV['TOKEN']
  end
end
