class Subscription
  include Mongoid::Document

  belongs_to :user
  belongs_to :show

  field :resolution
  field :source
end
