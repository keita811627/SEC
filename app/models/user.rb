class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :

  def active_for_authentication?
    super && (self.is_active == true)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :requests, dependent: :destroy

  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true



end
