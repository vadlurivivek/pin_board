class Pin < ApplicationRecord
	acts_as_votable
	
	belongs_to :user
	has_attached_file :image , styles: {medium: "300X300>"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :title, presence: true
	validates :description, presence: true
	validates :image, presence: true
end
