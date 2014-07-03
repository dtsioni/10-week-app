class AddPostIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :post_id, :Integer
  end
end
