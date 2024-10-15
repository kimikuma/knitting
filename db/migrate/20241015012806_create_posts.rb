class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.integer :user_id
      t.string :knittingname
      t.timestamps
    end
  end
end
