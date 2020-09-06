class Book < ApplicationRecord
  belongs_to :user, optional: true
  attachment :profile_image
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}

  def favorited_by?(user)
	 favorites.where(user_id: user.id).exists?
  end

  def Book.search(how, word, model)
    if how == "partical"
  	  Book.where("title LIKE?", "%#{word}%")
    elsif how == "forward"
  	  Book.where("title LIKE?", "#{word}%")
    elsif how == "backward"
  	  Book.where("title LIKE?", "%#{word}")
    elsif how == "match"
  	  Book.where("#{word}")
    end
  end

end