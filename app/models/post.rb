class Post < ActiveRecord::Base

  validates :content, presence: true, length: {maximum: 155}
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likings, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  def feed
    Comment.where("post_id = ?", id)
  end

end
