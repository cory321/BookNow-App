class AddUserRefToAssistants < ActiveRecord::Migration
  def change
    add_reference :assistants, :user, index: true, foreign_key: true
  end
end
