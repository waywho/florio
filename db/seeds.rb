# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'
Word.delete_all
csv_text = File.read(Rails.root.join('lib', 'seeds', 'florio6.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
	# item = find_by_id(row["id"]) || new
	item = Word.new
	item.attributes = row.to_hash.slice(*Word.column_names)
	item.save!
end
puts "There are now #{Word.count} rows in the transactions table"