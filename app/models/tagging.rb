class Tagging < ActiveRecord::Base
  belongs_to :vent
  belongs_to :tag
end
