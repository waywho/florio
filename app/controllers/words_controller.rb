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

	def text_search
	end

	def text_translate
		@text = word_params[:text].split(/\s*[.,;?!]\s*|\s|[\r\n]+/x)
		
		@results = {}
		@text.each do |search_word|
			word = Word.find_by_fuzzy_word(search_word, :limit=> 1).first
			if word.definition.nil?
				@results[search_word] = search_word
			# elsif word.word.nil?
			# 	@results[search_word] = search_word
			else
				@results[word.word] = word.definition
			end
		end
		respond_to :html, :js
		# render json: {results: @results, text: @text}
	end

	def show
		@word = Word.find(params[:id])
		@words = Word.find_by_fuzzy_word(@word.word, :limit => 10)
		render :action => :index
	end

	def edit
		@word = Word.find(params[:id])
	end

	def update
		@word = Word.find(params[:id])
		@word.update_attributes(word_params)
		redirect_to root_path
	end


	private

	def word_params
		params.require(:word).permit(:word, :definition, :alternative_word, :alternative_definition, :text)
	end
end
