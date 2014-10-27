require 'open-uri'
require 'zip'

class Downloader

  def initialize(url, path, lib_folder)
    @url = url
    @path = path
    @lib_folder = lib_folder
    @post_fix_url = "/archive/master.zip"
    en

    def run
      begin
        puts "from: #{url} - to: #{lib_folder}"
        file_name = url.split("/").last
        file_name_with_path = "#{path}/#{lib_folder}/#{file_name}.zip"
        create_lib_folder(path, lib_folder)
        download_file(file_name_with_path)
        unzip(file_name_with_path, path, lib_folder)
        delete(file_name_with_path)
      rescue => error
        puts "Error #{error}"
      end
    end

    def download_file(file_name_with_path)
      File.open(file_name_with_path, "wb") do |saved_file|
        open("#{url}#{post_fix_url}", "rb") do |read_file|
          saved_file.write(read_file.read)
        end
      end
    end

    def unzip(file_name_with_path, path, lib_folder)
      Zip::ZipFile.open(file_name_with_path, ) { |zip_file|
        zip_file.each { |f|
          f_path=File.join(path, lib_folder , f.name)
          FileUtils.mkdir_p(File.dirname(f_path))
          zip_file.extract(f, f_path) unless File.exist?(f_path)
        }
      }
    end

    def create_lib_folder(path, folder)
      FileUtils.mkdir_p("#{path}/#{folder}")
    end

    def delete(file_name_with_path)
      File.delete(file_name_with_path)
    end

    attr_reader :url, :path, :lib_folder, :post_fix_url
  end