require 'thor'
require 'yaml'

require_relative 'controller'
require_relative 'configuration'

module Acli
  class CLI < Thor

    def help
      puts "a(wesome swift)cli\n"
      puts "acli list             - lists all available downloads\n"
      puts "acli config           - writes default config file into .aclirc\n"
      puts "acli install async    - installs async lib into swift_lib folder\n"
    end

    desc 'lists all available libs', 'lists all available libraries for a(wesome swift)cli'
    def list(*args)
      controller.list_available_libraries.each do |url|
        puts url
      end
    end

    desc 'install name', 'install. takes a name(s) of library to install.'
    def install(*name)
      controller.install(name)
    end

    desc 'config', 'config writes config in .aclirc file'
    def config(*args)
      controller.create_config
    end

    private

    def controller
      @_controller ||= Controller.new
    end
  end
end
