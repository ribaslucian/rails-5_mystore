ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# definindo como padrao o ip 0.0.0.0
require 'rails/commands/server'
module Rails
  class Server
    def default_options
      super.merge(Host:  '0.0.0.0', Port: 3000)
    end
  end
end
