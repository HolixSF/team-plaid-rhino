class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :response_to, polymorphic: true
  has_many :votes, as: :vote_for

  validates :text, presence: true

  def vote_total
    if self.votes.empty?
      return 0
    else
      return self.votes.map(&:vote_value).reduce(:+)
    end
  end

end
