class CreateRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :requests do |t|
      t.string :song_name
      t.integer :user_id
      t.boolean :active
      t.integer :rank

      t.timestamps
    end
  end
end
