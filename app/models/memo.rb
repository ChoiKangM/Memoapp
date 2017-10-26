class Memo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  # TODO: validation
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
  validates :user_id, presence: true
end
 