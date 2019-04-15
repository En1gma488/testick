class Article < ApplicationRecord

	include HTTParty
	
	belongs_to :source
 	validates :source, :title, presence: true
end
