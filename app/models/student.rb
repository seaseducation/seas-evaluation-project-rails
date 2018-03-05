class Student < ApplicationRecord
  belongs_to :grade
  belongs_to :program, optional: true
  belongs_to :school

  validates :first_name, :last_name, presence: true

  def first_last_name
    [first_name, last_name].join(' ')
  end
end
