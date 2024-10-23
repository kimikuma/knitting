class AddViewCountToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :view_count, :integer
  end
end
