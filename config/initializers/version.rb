class Application
  VERSION = '0.1.0'.freeze

  def self.version_app
    p "TestGuru v.#{VERSION}"
  end
end

Application.version_app
