class Post < ActiveRecord::Base
	validates :title, :text,  presence: true
	validates :title, :text, length: { minimum: 5 }
	
	has_many :comments, dependent: :destroy
end
