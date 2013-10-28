class Episode
  include Mongoid::Document

  belongs_to :show
  has_many :releases, as: :releasable

  field :season, type: Integer
  field :number, type: Integer
  field :identifier

  field :title
  field :overview
  field :images, type: Hash

  field :trakt

  after_create :denormalize

  def denormalize
    self.update_attributes identifier: "#{show.title} S#{'%02d' % season}E#{'%02d' % number}"
  end
end
