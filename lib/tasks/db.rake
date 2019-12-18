namespace :db do
	desc "Reset the auto_increment for all tables"
	task :reset_auto_increment => :environment do
		ActiveRecord::Base.connection.tables.each do |table|
			if table != "schema_migrations"
				result = ActiveRecord::Base.connection.execute("SELECT id FROM #{table} ORDER BY id DESC LIMIT 1")
				if result.any?
					ai_val = result.first['id'].to_i + 1
					puts "Resetting auto increment ID for #{table} to #{ai_val}"
					ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH #{ai_val}")
				end
			end
		end
	end
end
