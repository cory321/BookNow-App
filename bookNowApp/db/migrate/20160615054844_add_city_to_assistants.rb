class AddCityToAssistants < ActiveRecord::Migration
  def change
  	add_column :assistants, :city, :string
  end
end
