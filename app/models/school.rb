class School < ApplicationRecord
  has_many :students

  validates :title, :city, :state, presence: true
end
