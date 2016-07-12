class Comment < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 160 }
  belongs_to :user
  belongs_to :post

  default_scope -> { order(created_at: :desc) }
end
