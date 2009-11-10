# Simple Admin
## A database-less admin authentication based on OpenID

### Requires the following gems

  * ruby-openid
  * rack-openid

## Installation

#### Install the plugin

    script/plugin install git://github.com/markpercival/simple_admin.git

#### Add the following before filter to any protected controllers

    before_filter :ensure_admin
    
#### List the authorized OpenId's in 'config/simple_admins.yml'

    - markpercival.us
    - mark.squarepush.com

### When you login you should see this

![Login](http://img.skitch.com/20091110-fcteijh6y74q3qxm53ed7qyfr5.jpg 'Login Screen')

The following helpers are available in your controller and views:
	
  * current_user - returns the current authenticated user
  * authorized? - tells you whether or not the current session is authenticated

