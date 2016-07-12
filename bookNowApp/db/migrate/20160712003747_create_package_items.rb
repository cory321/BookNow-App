class CreatePackageItems < ActiveRecord::Migration
  def change
    create_table :package_items do |t|
      t.references :package, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
