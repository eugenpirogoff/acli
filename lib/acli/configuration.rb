require 'yaml'

class Configuration
  def initialize(path)
    @path = path
    @config = YAML.load(default_config_string)
  end

  def load_from_file
    if File.exist?("#{path}/.aclirc")
      @config = YAML.load_file(File.expand_path("#{path}/.aclirc"))
      puts "config loaded from #{path}"
    elsif File.exist?("#{ENV['HOME']}/.aclirc")
      @config = YAML.load_file(File.expand_path("#{ENV['HOME']}/.aclirc"))
      puts "config loaded from #{ENV['HOME']}"
    else
      puts "No config in #{@path}/.aclirc or #{ENV['HOME']}/.aclirc"
      puts "using default folder: #{lib_path.first}"
    end
  end

  def save_to_file
    File.open("#{path}/.aclirc", "w") do |f|
      f.write(@config.to_yaml)
    end
  end

  def lib_path
    @config['lib_path']
  end

  def repository
    @config['repository']
  end

  def default_config_string
"repository:
  - https://raw.githubusercontent.com/Wolg/awesome-swift/master/README.md
  - https://raw.githubusercontent.com/matteocrippa/awesome-swift/master/README.md
lib_path:
  - 'swift_lib'"
  end

  attr_accessor :path, :config

end
