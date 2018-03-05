class AddProgramToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :program, foreign_key: true
  end
end
