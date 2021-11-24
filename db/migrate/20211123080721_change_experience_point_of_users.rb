class ChangeExperiencePointOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :experience_point, :integer, default: 1
  end
  
  def down
    change_column :users, :experience_point, :integer
  end
end
