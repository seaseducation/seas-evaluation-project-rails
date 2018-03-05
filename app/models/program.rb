class Program < ApplicationRecord
  VALID_TITLES = %w[IEP 504].freeze

  has_many :students

  validates :title, presence: true, inclusion: { in: VALID_TITLES }
end
