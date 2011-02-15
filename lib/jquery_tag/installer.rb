require 'jquery_tag'
require 'optparse'
require 'open-uri'

module JqueryTag
  class Installer

    attr_reader :path, :version, :arguments

    def initialize(arguments)
      @version = JqueryTag.version
      @path = File.expand_path("public/javascripts/jquery.js")
      @arguments = arguments
    end

    def start
      parse!
      run
    end

    private

    def parse!
      OptionParser.new do |opts|
        opts.banner = "Usage: jquery_tag [-v VERSION] [-p PATH]"
        opts.on("-v", "--version VERSION", "Sets the target version to download. Defaults '#{JqueryTag.version}'.") { |v| @version = v }
        opts.on("-p", "--path PATH", "The path to save the script file. Defaults to 'public/javascripts/jquery.js'.") { |path| @path = path }
        opts.on("-h", "--help", "Outputs this message.") { puts opts; exit }
      end.parse!(arguments)
    end

    def run
      content = open("http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.js") { |io| io.binmode.read }
      FileUtils.mkdir_p(File.dirname(path))
      File.open(path, "w") { |file| file.write(content) }
      puts "jQuery #{version} downloaded to #{path}"
    end
  end
end