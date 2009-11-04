class SessionsController < ApplicationController
  
  def create
    if openid = request.env["rack.openid.response"]
      if openid.status == :success
        if sa = SimpleAdmin.find(openid.display_identifier)
          current_user = sa.openid
          render :text => "Welcome: #{sa.openid}"
        end
      else
        render :text => "Error: #{openid.status}"
      end
    else
      response.headers['WWW-Authenticate'] = Rack::OpenID.build_header(
        :identifier => params["openid_identifier"]
      )
      render :text => '', :status => 401
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have been signed out"
    redirect_to '/'
  end
  
  private
  
  def current_user=(openid)
    session[:simple_admin] = openid
  end 
  
  def current_user
    SimpleAdmin.find(session[:simple_admin])
  end
end