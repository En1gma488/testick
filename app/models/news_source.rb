class NewsSource < ApplicationRecord
	# self.table_name = "sources"
	has_many :articles

	has_many :user_source
	has_many :user, through: :user_source
end
