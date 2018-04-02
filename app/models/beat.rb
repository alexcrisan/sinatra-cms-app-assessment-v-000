class Beat < ActiveRecord::Base
  belongs_to :user
  has_many :beat_tags
  has_many :tags, through: :beat_tags
end
