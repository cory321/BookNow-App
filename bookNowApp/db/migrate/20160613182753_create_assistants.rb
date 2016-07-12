class CreateAssistants < ActiveRecord::Migration
  def change
    create_table :assistants do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :avatar

      t.timestamps null: false
    end
  end
end
