class Sale < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :scomments
  validates :content, presence: true, length: { maximum: 254 }
  validates :user_id, presence: true

  default_scope order: 'sales.created_at DESC'

   def self.search(search)
    if search
      where('content LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
