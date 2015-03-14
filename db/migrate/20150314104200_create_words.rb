class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
    	t.string :word
    	t.string :definition
    	t.string :alternative_word
    	t.string :alternative_definition
      t.timestamps
    end
  end
end
