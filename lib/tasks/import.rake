require 'csv'

desc "Import  teams from csv file"
task :import => [:environment] do

	file = "db/florio5.csv"

	CSV.foreach(file, :headers => true) do |row|
		Word.create(
			:alphabet => row[0],
			:word => row[1],
			:definition => row[2],
			:alternative_word => row[3], 
			:alternative_definition => row[4]
		)
	end
	
end