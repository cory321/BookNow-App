class PackageItem < ActiveRecord::Base
  belongs_to :package
  belongs_to :item
end
