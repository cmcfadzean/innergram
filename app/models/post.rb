class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  acts_as_votable
  has_attached_file :photo, styles: { lg: "800x800>", md: "500x500>", sm: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates :photo, :attachment_content_type => { :content_type => ['image/png', 'image/jpg']}
end
