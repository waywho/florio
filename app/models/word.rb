class Word < ActiveRecord::Base
	fuzzily_searchable :word
	
SOURCE = {
	'A' => 'http://www.pbm.com/~lindahl/florio/016small.html'
}

end
