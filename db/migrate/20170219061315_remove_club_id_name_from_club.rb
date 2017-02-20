class RemoveClubIdNameFromClub < ActiveRecord::Migration
  def change
    remove_column :clubs, :club_id
  end
end
