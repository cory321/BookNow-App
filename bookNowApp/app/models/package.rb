class Package < ActiveRecord::Base
  belongs_to :user
  has_many :package_items, dependent: :destroy
  has_many :items, through: :package_items
end
