class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  has_many :responses, as: :response_to
  has_many :votes, as: :vote_for

  def vote_total
    if self.votes.empty?
      return 0
    else
      return self.votes.map(&:vote_value).reduce(:+)
    end
  end
end
