class Question < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  belongs_to :question_status

  has_many :answers, dependent: :destroy

  def self.search(keyword)
  where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

  validates :title, presence: true
  validates :body, presence: true
end
