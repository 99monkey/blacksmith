require 'uglifier'
require 'gzip'
require 'jshintrb'

module Blacksmith
  class Application

    def root
      @root ||= Dir.pwd
    end


    def build
      files = Blacksmith.config.build_files

      files.each do |f|
        output = Preprocessor.proccess(f)

        if Blacksmith.config.jshint
          puts Jshintrb.report(["#{Blacksmith.config.source_folder}/#{f}.js"]) #need pullrequest Jshintrb
        end

        if Blacksmith.config.env == :production
          output = Uglifier.compile(output)
        end

        output_file = File.new(output_filename_helper(f), 'w')
        output_file.write(output)


        if Blacksmith.config.gzip
          output_file_gzip = File.new(output_filename_helper(f, :gzip => true), 'w')
          output_file_gzip.write(output.gzip)
        end
      end

      puts 'Build successfully.'
    end


    protected

    def output_filename_helper(file, options ={})
      suffix = options[:gzip] ? '.gz' : ''
      "#{Blacksmith.config.build_folder}/#{file.gsub('_', '-')}.js#{suffix}"
    end
  end
end
