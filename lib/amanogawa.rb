require 'octokit'
require 'fileutils'
require "amanogawa/version"

class Amanogawa
  FORMAT_TABLE = {
    "%i" => "id",
    "%n" => "name",
    "%f" => "full_name",
    "%d" => "description",
    "%u" => "url",
    "%s" => "ssh_url",
    "%g" => "git_url",
    "%h" => "homepage",
    "%C" => "created_at",
    "%P" => "pushed_at",
    "%U" => "updated_at",
  }

  class << self
    def cache_file
      cache_dir = File.expand_path("~/.cache")
      FileUtils.mkdir(cache_dir) unless File.exists?(cache_dir)
      File.join(cache_dir, "amanogawa.dump")
    end

    def output(format)
      do_output(load_cache, format)
    end

    def fetch_output(format, *args)
      client = Client.new(*args)
      do_output(client.fetch, format)
    end

    def load_cache
      Marshal.load(File.read(cache_file))
    end

    private

    def do_output(data, format)
      data.each do |s|
        line = FORMAT_TABLE.inject(format) do |l, (k, v)|
          l.gsub(/#{k}/, s.send(v).to_s)
        end
        puts line.gsub(/%t/, "	")
      end
    end
  end

  class Client
    def initialize(*args)
      case args.length
      when 0
        @client = Octokit::Client.new(netrc: true)
      when 1
        @client = Octokit::Client.new(access_token: args[0])
      when 2
        @client = Octokit::Client.new(login: args[0], password: args[1])
      else
        raise ArgumentError
      end
    end

    def fetch
      @client.auto_paginate = true
      @client.starred
    end

    def sync
      File.open(Amanogawa.cache_file, "w") { |f| f.write(Marshal.dump(fetch)) }
    end
  end
end
