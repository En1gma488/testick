class NewsSource < ApplicationRecord
	# self.table_name = "sources"
	has_many :articles

	has_many :user_sources
	has_many :users, through: :user_sources
end
