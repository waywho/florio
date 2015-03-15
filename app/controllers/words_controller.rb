class WordsController < ApplicationController
	def index
		@word = Word.order("RANDOM()").first
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
