class QuestionStatus < ApplicationRecord

  has_many :questions, dependent: :destroy

end
