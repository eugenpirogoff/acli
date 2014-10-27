require 'typhoeus'
require 'nokogiri'

class Repository
  def initialize(repo_urls)
    @repo_urls = repo_urls
  end

  def list_names
    list.each_with_object([]) {|url,ary|ary.push(url.split("/").last)}
  end

  def list_urls
    list
  end

  def find_url(library)
    list.find {|url| url.split("/").last.downcase.include?(library.downcase)}
  end

  private

  def list
    parse_markdown_from_config_urls.each_with_object([]) do |url, ary|
      if url.include?('github.com') && !url.include?('awesome-php') && !url.include?('w3.org')
        ary.push(url.downcase)
      end
    end
  end

  def parse_markdown_from_config_urls
    download_from_config.each_with_object([]) do |markdown_readme, ary|
      Nokogiri::HTML(markdown_readme).to_s.scan(/http.\S*\w/).each do |url|
        ary.push(url)
      end
    end
  end

  def download_from_config
    repo_urls.each_with_object([]) do |repository_url, ary|
      response = Typhoeus.get(repository_url)
      if response.code == 200
        ary.push(response.body)
      else
        puts "Request failed with http code: #{response.code}"
        return nil
      end 
    end
  end

  attr_reader :repo_urls
end
