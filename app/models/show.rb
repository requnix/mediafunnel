class Show
  include Mongoid::Document

  has_many :episodes
  has_many :subscriptions

  field :title
  field :year, type: Integer
  field :country

  field :trakt

  field :imdb_id
  field :tvdb_id
  field :tvrage_id

  field :overview
  field :runtime, type: Integer

  field :genres, type: Array
  field :images, type: Hash

  def slug
    trakt? ? trakt.split('/')[-1] : nil
  end
end
