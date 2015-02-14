class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :question_image_url, default: nil
      t.text :question_text, null: false
      t.text :explanation, null: false
      t.boolean :correct_answer, null: false
      t.boolean :karimen, default: true
      t.integer :correct_count, default: 0
      t.integer :miss_count, default: 0

      t.timestamps
    end
  end
end
