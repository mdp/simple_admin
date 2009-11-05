class SimpleAdmin
  
  attr_reader :openid
  
  def self.find(user)
    admins = YAML.load_file(File.join(RAILS_ROOT, 'config', 'simple_admins.yml'))
    matches = admins.delete_if {|admin|
      !(admin.match(/^(http:\/\/)?#{user.to_s}\/?$/) || user.to_s.match(/^(http:\/\/)?#{admin}\/?$/))
    }
    matches.empty? ? nil : self.new(user)
  end
  
  def initialize(user)
    @openid = user
  end
end