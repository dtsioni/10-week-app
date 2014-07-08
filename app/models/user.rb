class User < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :username
end
