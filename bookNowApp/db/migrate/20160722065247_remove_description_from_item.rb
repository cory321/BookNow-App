class RemoveDescriptionFromItem < ActiveRecord::Migration
  def change
  	remove_column :items, :description, :string
  	change_column :items, :name, :text
  end
end
