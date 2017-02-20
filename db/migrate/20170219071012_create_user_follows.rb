class CreateUserFollows < ActiveRecord::Migration
  def change
    create_table :user_follows do |t|
      t.integer :follower_id
      t.integer  :followable_id,   :null => false
      t.string   :followable_type, :limit => 50
      t.timestamps
    end

    add_index :user_follows, :follower_id
    add_index :user_follows, [:followable_id, :followable_type]
  end
end
