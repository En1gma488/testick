class UserSource < ApplicationRecord
	belongs_to :user
	belongs_to :news_sourse
end
