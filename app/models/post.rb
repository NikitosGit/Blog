class Post < ActiveRecord::Base
	validates :title, :text,  presence: true
	
	has_many :comments, dependent: :destroy
end
