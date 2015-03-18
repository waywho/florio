class WordsController < ApplicationController
	def index
		if params[:search].present?
			word = Word.find_by_fuzzy_word(params[:search], :limit=> 5).first

			@words = Word.find_by_fuzzy_word(params[:search], :limit => 10)
			if word.word != params[:search]
				flash.now[:alert] = "Sorry, no word matching #{params[:search]} is found."
				render :action => :index
			else
				@word = word
			end
		end
	end

	def show
		@word = Word.find(params[:id])
		@words = Word.find_by_fuzzy_word(@word.word, :limit => 10)
		render :action => :index
	end

	def edit
		@word = Word.find(params[:id])
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
