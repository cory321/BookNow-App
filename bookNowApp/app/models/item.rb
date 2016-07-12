class Item < ActiveRecord::Base
	validates_uniqueness_of :name
	has_many :package_items, dependent: :destroy
	has_many :packages, through: :package_items
end
