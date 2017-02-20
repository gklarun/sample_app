class RemoveUseridNameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_id
    remove_column :users, :common_user
    remove_column :users, :moderator
    remove_column :users, :analyst
    remove_column :users, :admin
  end
end
