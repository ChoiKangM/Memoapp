class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :memo
  
  # TODO: validation
  validates :content, presence: true, length: { minimum: 2, maximum: 100 }
  validates :memo_id, presence: true
  validates :user_id, presence: true
end
