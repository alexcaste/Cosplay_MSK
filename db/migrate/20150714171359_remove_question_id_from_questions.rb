class RemoveQuestionIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :candidates, :question_id
  end
end
