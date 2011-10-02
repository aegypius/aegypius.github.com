module Jekyll
  
  class LessStaticFile < StaticFile
    def write(dest)
      # nothing to do
    end
  end
  
  class LessGenerator < Generator 
    NAME    = 'LESS Generator'
    VERSION = 0.2

    safe true
    priority :low


    def generate(site)
      #Configuration
      config = {
        # Generation
        'lessc_path'  => 'lessc', 
        'source'      => '_styles', 
        'destination' => 'styles',
        'exclude'     => [],
        # Compression 
        'compression' => false,
        'csstidy_path' => 'csstidy',
        # Debugging 
        'verbose'     => site.config['auto'] != true
      }.merge(site.config['less'] || {})

      less_ext  = /\.less$/i

      # Excludes can be an Array of Strings or Regexps
      if (config['exclude'].class != Array)
        config['exclude'] = [config['exclude']]
      end 



      `which #{config['lessc_path']} &> /dev/null`
      lessc_found = $?.to_i == 0
      if config['compression']
				`which #{config['csstidy_path']} &> /dev/null`
      	compressor_found = $?.to_i == 0
      end
       

      puts "
#{NAME} #{VERSION}
  options:
    - lessc found:   #{lessc_found}
      - source:      #{site.config['source']}/#{config['source']}
      - destination: #{site.config['destination']}/#{config['destination']}
      - exclusions:  #{config['exclude']}
    - compression:   #{config['compression']} %s
      " % (config['compression'] ? "\n      - compressor found: %s" % compressor_found : "") if config['verbose'] == 2

      raise "Missing dependencies: lessc" if !lessc_found

      base      = File.join(site.config['source'], config['source'])
      return unless File.exists?(base)

      dest      = File.join(site.config['destination'], config['destination'])
      
      puts "Compiling LESS: #{base} -> #{dest}" if config['verbose'] < 2

      less_files = []
      entries = Dir.chdir(base) { site.filter_entries(Dir['**/*'])}
      entries.each do |f|

        next if not f =~ less_ext

        # Exclusion test
        match = false
        config['exclude'].each do |x|
          break if match = f.match(Regexp.new(x))
        end

        next if match

        less_path = File.join(base, f)
        css_path  = File.join(dest, f.gsub(less_ext, '.css'))
        FileUtils.mkdir_p(File.dirname(css_path))

        less_files.push([less_path, css_path])
      end

      less_files.each do |less_path, css_path|
        begin
          puts " LESSC #{less_path} -> #{css_path}" if config['verbose'] == 2
          cmd = [config['lessc_path'], less_path, css_path].join(' ')
          `#{cmd}`
          raise "Compilation error" if $?.to_i != 0
        end
              
         # Add this output file to static_files so it won't be cleaned
         dir      = File.dirname(css_path.gsub(site.config['destination'], ''))
         filename = File.basename(css_path)
         site.static_files << LessStaticFile.new(site, site.source, dir, filename)
      end
      
      if config['compression'] != false and compressor_found
        template = 'highest'
        template = config['compression'] if config['compression'] != true
        less_files.each do |less_path, css_path|
          begin
						puts " STRIP #{css_path}" if config['verbose'] == 2
						cmd = [config['csstidy_path'], css_path, '--template=' + template , css_path].join(' ')
						`#{cmd}`
						puts "Compression failed" if $?.to_i != 0
					end
				end
			end
		end
  end
end

