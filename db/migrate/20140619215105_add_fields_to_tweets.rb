class AddFieldsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :body, :string
    add_column :tweets, :user_id, :integer
  end
end
