class AddUserIDtoClub < ActiveRecord::Migration
  def change
    add_column :clubs , :user_id , :integer, index: true
  end
end
