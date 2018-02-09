class Book < ActiveRecord::Base
  belongs_to :reviewer
  has_many :notes, dependent: :destroy
  has_attached_file :image, styles: { thumb: ["150x200#", :jpg] }
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
