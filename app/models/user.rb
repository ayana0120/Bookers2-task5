class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20}
  validates :introduction, length: { maximum: 50 }

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  attachment :profile_image

  def followed_by?(user)
    passive_relationships.where(following_id: user.id).exists?
  end

  def self.search(search,word)
    if search == "partical"
      @user = User.where("name LIKE?", "%#{content}%")
    elsif search == "forward"
      @user = User.where("name LIKE?", "#{content}%")
    elsif search == "backward"
      @user = User.where("name LIKE?", "%#{content}")
    elsif serch == "match"
      @user = User.where("#{[word]}")
    else
      @user = User.all
    end
  end
end
