class User < ActiveRecord::Base
  has_one :game
  validates :name, :presence => true
end
