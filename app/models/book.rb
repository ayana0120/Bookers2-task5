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

  def self.search(search,word)
    if search == "partical"
  	  @book = Book.where("name LIKE?", "%#{content}%")
    elsif search == "forward"
  	  @book = Book.where("name LIKE?", "#{content}%")
    elsif search == "backward"
  	  @book = Book.where("name LIKE?", "%#{content}")
    elsif serch == "match"
  	  @book = Book.where("#{[word]}")
    else
  	  @book = Book.all
    end
  end

end