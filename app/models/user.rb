class User < ActiveRecord::Base
  has_one :game
end
