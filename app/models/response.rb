class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :response_to, polymorphic: true
  has_many :votes, as: :vote_for

  validates :text, presence: true
end
