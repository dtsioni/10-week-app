class RemoveAuthorFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :author, :String
  end
end
