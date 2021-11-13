class AddQuestionStatusIdToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :question_status_id, :integer
  end
end
