class AutosearchesController < ApplicationController
	def index
		@words = Word.find_by_fuzzy_word(params[:term], :limit => 10)
		render json: @words.map(&:word)
	end
end
