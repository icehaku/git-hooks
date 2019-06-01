class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def auth
    respond_to do |format|
      format.html do
        raise "NotAuthorized"
      end

      format.json do
        render json: { "error": "NotAuthorized" }
      end
    end if auth_buss(params)
  end

  def auth_buss params
    params[:token].blank? or params[:token] != "ice"
  end
end
