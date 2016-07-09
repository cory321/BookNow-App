class RemoveEventRefFromCouples < ActiveRecord::Migration
  def change
  	remove_reference :couples, :event, index: true, foreign_key: true
  end
end
