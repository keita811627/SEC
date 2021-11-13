class Question < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  belongs_to :question_status

  has_many :answers, dependent: :destroy

end
