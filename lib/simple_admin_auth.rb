module SimpleAdminAuth

  protected

    def current_user=(openid)
      session[:simple_admin] = openid
    end

    def current_user
      @current_user ||= SimpleAdmin.find(session[:simple_admin])
    end

    def authorized?
      !!current_user
    end
    
    def ensure_admin
      access_denied unless authorized?
    end

    def store_location
      session[:return_to] = request.request_uri
    end
    
    def access_denied
      respond_to do |format|
        format.html do
          store_location
          redirect_to new_session_path
        end
        # format.any doesn't work in rails version < http://dev.rubyonrails.org/changeset/8987
        # Add any other API formats here.  (Some browsers, notably IE6, send Accept: */* and trigger 
        # the 'format.any' block incorrectly. See http://bit.ly/ie6_borken or http://bit.ly/ie6_borken2
        # for a workaround.)
        format.any(:json, :xml) do
          request_http_basic_authentication 'Web Password'
        end
      end
    end

end
