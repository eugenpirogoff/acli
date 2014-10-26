require_relative 'repository'
require_relative 'downloader'
require_relative 'configuration'

class Controller
	
	def initialize

	end

	def list_available_libraries
		repository.list_urls
	end

	def install(names)
		config_file.load_from_file
		names.each do |name| 
			if url = repository.find_url(name)
				Downloader.new(url, Dir.pwd, config_file.lib_path.first).run
			else
				puts "#{name} could not be found in library repository"
			end
		end
	end

	def create_config
		config_file.save_to_file
	end

	def repository
		@_repository ||= Repository.new(config_file.repository)
	end

	def config_file
		@config_file ||= Configuration.new(Dir.pwd)
	end
end
