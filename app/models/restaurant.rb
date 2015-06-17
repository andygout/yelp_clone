class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true

  def build_review(current_user, review_params)
    review_foreign_keys = {:restaurant => self, :user => current_user}
    review = Review.new(review_params.merge(review_foreign_keys))
  end
end
