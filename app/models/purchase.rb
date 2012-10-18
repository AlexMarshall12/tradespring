class Purchase < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :pcomments
  validates :content, presence: true, length: { maximum: 254 }
  validates :user_id, presence: true

  default_scope order: 'purchases.created_at DESC'

   def self.search(search)
    if search
      where('content LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
