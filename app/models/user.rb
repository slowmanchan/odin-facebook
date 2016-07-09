class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id"

  has_many :following, through: :active_relationships, source: :followed

  def feed
    Post.where("user_id = ?", id)
  end

  # follows user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # unfollows user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
