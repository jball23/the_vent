class Vent < ActiveRecord::Base

  has_many :responses
  has_many :taggings
  has_many :tags, :through => :taggings

  validates :name, :body, presence: true
end
