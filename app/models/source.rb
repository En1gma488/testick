class Source < ApplicationRecord
	
	has_many :articles, invers_of :source

	has_many :user_source 
	has_many :user, through: :user_source
end
