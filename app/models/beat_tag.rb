class BeatTag < ActiveRecord::Base
  belongs_to :beat
  belongs_to :tag
end
