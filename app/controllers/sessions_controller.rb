class SessionsController < ApplicationController
  
  def new
    render :layout => nil
  end
  
  def create
    if openid = request.env["rack.openid.response"]
      if openid.status == :success
        if sa = SimpleAdmin.find(openid.display_identifier)
          self.current_user = sa.openid
          p self.current_user
          if session[:return_to]
            redirect_to session[:return_to]
          else
            redirect_to '/'
          end
        else
          flash[:error] = "Not Authorized"
          render :new
        end
      else
        flash[:error] = "Error: #{openid.status}"
        render :new
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
  
end