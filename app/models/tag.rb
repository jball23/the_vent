class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :vents, :through => :taggings
end
