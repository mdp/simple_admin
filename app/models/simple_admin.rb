class SimpleAdmin
  
  attr_reader :openid
  
  def self.find(user)
    admins = YAML.load_file(File.join(RAILS_ROOT, 'config', 'simple_admins.yml'))
    if admins.include?(user)
      self.new(user)
    end
  end
  
  def initialize(user)
    @openid = user
  end
end