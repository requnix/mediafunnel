class Release
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  validates_presence_of :releasable, :source, :resolution, :magnet
  validates_format_of :magnet, with: /\Amagnet:/, message: "link is not valid"

  belongs_to :releasable, polymorphic: true

  field :source # HDTV, WEB, BluRay
  field :resolution # HDTV, 720p, 1080p
  field :magnet
  field :group
end
