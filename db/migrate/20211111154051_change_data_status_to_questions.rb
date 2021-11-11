class ChangeDataStatusToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :status, :text
  end
end
