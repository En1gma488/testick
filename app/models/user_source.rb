class UserSource < ApplicationRecord
	belongs_to :user
	belongs_to :news_sourse, class_name: 'NewsSource', foreign_key: 'source_id'

end
