class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :votes, as: :vote_for
  has_many :responses, as: :response_to

end
