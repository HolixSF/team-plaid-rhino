class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id, :null => false
      t.integer :question_id, :null => false
      t.boolean :best_answer, :default => false
      t.string :text, :null => false

      t.timestamps
    end
  end
end
