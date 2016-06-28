class AddEventRefToCouples < ActiveRecord::Migration
  def change
  	add_reference :couples, :event, index: true, foreign_key: true
  end
end
