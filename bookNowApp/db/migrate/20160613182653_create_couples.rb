class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.date :wedding_date
      t.string :groom_first_name
      t.string :groom_last_name
      t.string :groom_email
      t.string :groom_phone
      t.string :groom_location_gr
      t.string :bride_first_name
      t.string :bride_last_name
      t.string :bride_email
      t.string :bride_phone
      t.string :bride_location_gr
      t.string :planner_first_name
      t.string :planner_last_name
      t.string :planner_email
      t.string :planner_phone

      t.timestamps null: false
    end
  end
end
