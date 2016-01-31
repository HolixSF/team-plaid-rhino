class AddBestAnswerColumnToAnswers < ActiveRecord::Migration
  def change
    add_column(:answers, :best_answer, :integer, default: 0)
  end
end
