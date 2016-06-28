class AddUserRefToCouples < ActiveRecord::Migration
  def change
    add_reference :couples, :user, index: true, foreign_key: true
  end
end
