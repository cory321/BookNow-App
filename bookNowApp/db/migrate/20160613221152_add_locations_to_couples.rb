class AddLocationsToCouples < ActiveRecord::Migration
  def change
  	add_column :couples, :ceremony_address, :string
  	add_column :couples, :reception_address, :string
  	add_column :couples, :marital_address, :string
  end
end
