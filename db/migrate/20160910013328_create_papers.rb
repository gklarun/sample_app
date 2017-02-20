
class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :paper_id
      t.string :title
      t.string :author
      t.string :speciality
      t.string :doi
      t.string :journal
      t.timestamps null: false
    end
  end
end

