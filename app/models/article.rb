class Article < ApplicationRecord
	belongs_to :source
 	validates :source, :title, presence: true
end
