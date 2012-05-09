class Game < ActiveRecord::Base
  belongs_to :user1, :class_name => "User", :foreign_key => "user1_id"
  belongs_to :user2, :class_name => "User", :foreign_key => "user2_id"
  belongs_to :turn, :class_name => "User", :foreign_key => "turn_id"
  has_one :board
  
  def fat7y
    [self.id, self.user1.name]
  end
end
