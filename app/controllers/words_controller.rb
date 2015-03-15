class WordsController < ApplicationController
	def index
		@words = Word.find_by_fuzzy_word(params[:search], :limit => 10)
	end

	def import
		Word.import(params[:file])
		redirect_to root_url, notice: "Products imported."
	end

	private

	def csv_params
		params.require(:word).permit(:word, :definition, :alternative_word, :alternative_definition, :alphabet)
	end
end
