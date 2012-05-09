class Game < ActiveRecord::Base
  belongs_to :user1, :class_name => "User", :foreign_key => "user_id"
  belongs_to :user2, :class_name => "User", :foreign_key => "user_id"
  belongs_to :turn, :class_name => "User", :foreign_key => "user_id"
  has_one :board
end
