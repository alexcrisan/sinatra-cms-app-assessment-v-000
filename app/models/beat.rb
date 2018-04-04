class Beat < ActiveRecord::Base
  belongs_to :user
  has_many :beat_tags
  has_many :tags, through: :beat_tags


  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Beat.all.find{|beat| beat.slug == slug}
  end

end
