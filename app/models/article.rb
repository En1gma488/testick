class Article < ApplicationRecord
	has_one_attached :image 
	
	belongs_to :news_source, class_name: "NewsSource", optional: true, foreign_key: 'source_id'
 	validates :title, presence: true
 	# validates :source_id, uniqueness: true 
end
