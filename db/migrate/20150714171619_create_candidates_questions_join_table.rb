class CreateCandidatesQuestionsJoinTable < ActiveRecord::Migration
  def change
    create_table :candidates_questions, id: false do |t|

      t.belongs_to :question, index: true
      t.belongs_to :candidate, index: true
      t.timestamp
    end
  end
end
