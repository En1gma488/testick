class Article < ApplicationRecord
	belongs_to :source
 	validates :title, presence: true
 	validates :source_id, uniqueness: true 

end
