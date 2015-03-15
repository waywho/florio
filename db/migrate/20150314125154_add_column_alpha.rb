class AddColumnAlpha < ActiveRecord::Migration
  def change
  	add_column :words, :alphabet, :string

  	add_index :words, :alphabet
  end
end
