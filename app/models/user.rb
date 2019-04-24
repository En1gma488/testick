class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :recoverable,
  enum roll: [:user, :admin]
  enum status: [:deactivated, :activated]

  has_many :user_sources
  has_many :news_sources, through: :user_sources, foreign_key: 'source_id'
  has_many :articles, through: :user_sources

  validates :first_name, :last_name, presence: true, length: { in: 2..25 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  devise :database_authenticatable, :registerable,
          :rememberable, :validatable

  def set_default_role
    self.role ||= :user
  end
  
end
