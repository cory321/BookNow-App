class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.date :wedding_date
      t.text :groom_first_name
      t.text :groom_last_name
      t.text :groom_email
      t.text :groom_phone
      t.text :groom_location_gr
      t.text :bride_first_name
      t.text :bride_last_name
      t.text :bride_email
      t.text :bride_phone
      t.text :bride_location_gr
      t.text :planner_first_name
      t.text :planner_last_name
      t.text :planner_email
      t.text :planner_phone

      t.timestamps null: false
    end
  end
end
