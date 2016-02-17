class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :votes, as: :vote_for
  has_many :responses, as: :response_to

  validates :title, presence: { message: "Question can't be blank" }
  validate :ensure_slug_uniqueness

  def vote_total
    if self.votes.empty?
      return 0
    else
      return self.votes.map(&:vote_value).reduce(:+)
    end
  end

  def ensure_slug_uniqueness

    # we also want to ensure the slug is not blank
    if self.slug.blank?
      errors.add(:slug, "can't be blank")
    end

    # if this is a new post, the id is nil
    # otherwise, the slug should point to this post's id
    unless Slug[self.slug].nil? || Slug[self.slug] == self.id.to_s
      errors.add(:slug, "is already taken")
    end
  end

end
