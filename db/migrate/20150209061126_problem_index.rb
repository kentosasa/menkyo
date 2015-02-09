class ProblemIndex < ActiveRecord::Migration
  def change
    add_index :problems, :karimen
    add_index :problems, :question_text, unique: true
  end
end
