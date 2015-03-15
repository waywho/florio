class ChangeColumns < ActiveRecord::Migration
  def change
  	change_column :words, :definition, :text
  	change_column :words, :alternative_definition, :text
  end
end
