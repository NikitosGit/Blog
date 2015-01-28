class Comment < ActiveRecord::Base
	validates :text,  presence :true
	
	belongs_to :post
	validates :post, presence :true #Проверка что связь существует?!
end
