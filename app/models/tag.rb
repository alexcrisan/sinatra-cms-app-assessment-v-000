class Tag < ActiveRecord::Base
  has_many :beat_tags
  has_many :beats, through: :beat_tags
end
