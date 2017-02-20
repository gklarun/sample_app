class CreateClub < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :club_id
      t.string :name
      t.timestamps null: false
    end
  end
end
