class Word < ActiveRecord::Base
	fuzzily_searchable :word
	


# require 'csv'

# 	def self.import(file)
# 		CSV.foreach(file.path, headers: true) do |row|
# 			Word.create!(row.to_hash)
# 			# word = find_by_id(row["id"]) || new
# 			# parameters = ActionController::Parameters.new(row.to_hash)
# 			# word.attributes = row.to_hash.slice(parameters.permit(:word, :definition, :alternative_word, :alternative_definition, :alphabet))
# 			# word.save!
# 		end
# 	end
end
