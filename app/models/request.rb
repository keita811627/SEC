class Request < ApplicationRecord

  belongs_to :user, optional: true

  validates :request, presence: true

end
