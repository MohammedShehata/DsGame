class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.references :user1
      t.references :user2
      t.references :turn
      t.boolean :started
      t.boolean :ended

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
