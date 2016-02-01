class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :votes, as: :vote_for
  has_many :responses, as: :response_to

  validates :title, presence: { message: "Question can't be blank" }

  def vote_total
    # if self.votes.empty?
    #   return 0
    # else
      return self.votes.map(&:vote_value).reduce(:+)
    # end
  end

end
