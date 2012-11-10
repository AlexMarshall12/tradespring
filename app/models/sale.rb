class Sale < ActiveRecord::Base
  attr_accessible :content, :photo
  belongs_to :user
  has_many :scomments
  has_attached_file :photo,
     :styles => {
       :thumb=> "100x100#",
       :small  => "142x142>" }
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
