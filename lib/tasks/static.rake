# rake static:generate
# this will generate a static version of the app in the /dist directory
# asset paths are made relative


namespace :static do

  def kill_on_port(port_number)
    puts "- Killing whatever runs on port #{port_number}, if anything..."
    pid = `lsof -t -i:#{port_number}`
    if pid.empty?
      puts " Nothing found on port #{port_number}"
    else
      system "kill -9 #{pid}"
      puts " Pid #{pid} found on port #{port_number}: killed"
    end
  end
  
  # http://stackoverflow.com/questions/17536023/rake-assetsprecompilenodigest-in-rails-4
  def non_digested
    assets = Dir.glob(File.join(Rails.public_path, 'assets/**/*'))
    regex = /(-{1}[a-z0-9]{32}*\.{1}){1}/
    assets.each do |file|
      next if File.directory?(file) || file !~ regex

      source = file.split('/')
      source.push(source.pop.gsub(regex, '.'))

      non_digested = File.join(source)
      if file.match(/\.(js|css)\z/) or file.match(/css_sprite-/)
        puts "leaving #{file} untouched"
      else
        FileUtils.mv(file, non_digested)
      end
    end
  end

  def make_relative(filename, pattern, replacement)
    puts "Changing \"#{pattern}\" to \"#{replacement}\" in #{filename}"
    lines = IO.readlines(filename).map do |line|
      line.sub pattern, replacement
    end
    File.open(filename, 'w') do |file|
      file.puts lines
    end
  end

  def make_scripts_relative
    assets = Dir.glob(File.join(Rails.root, "dist/assets/*"))
    assets.each do |file|
      if file.match(/\.css\z/)
        make_relative file, "url(/assets/", "url("
      end
      if file.match(/\.js\z/)
        make_relative file, /:\s?\"\/assets/, ":\"assets"
      end
    end
  end

  def generate_static
    puts "- Clean-up"
    system "rake assets:clobber"
    system "rm -rf #{Rails.root}/dist"
    kill_on_port 3000
    puts "- Assets precompile"
    system "rake assets:precompile RAILS_ENV=production"
    non_digested
    puts "- Start rails in production mode"
    system "rails server -e production -d"
    puts "- Getting the static version of the homepage in static"
    res = system "cd #{Rails.public_path}; wget -m localhost:3000"
    if res
      system "mkdir #{Rails.root}/dist"
      system "cp #{Rails.public_path}/localhost\:3000/*.* #{Rails.root}/dist"
      system "rm -rf #{Rails.public_path}/localhost\:3000"
      system "mv #{Rails.public_path}/assets #{Rails.root}/dist"
      make_relative "#{Rails.root}/dist/index.html", "=\"/assets", "=\"assets"
      make_scripts_relative
      kill_on_port 3000
    else
      puts "- Failed to fetch the homepage"
    end
  end

  task :generate do
    generate_static
  end

  task :ios do
    generate_static
    system "cd phonegap && grunt ios"
  end

end