class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.references :game
      t.string :ele1
      t.string :ele2
      t.string :ele3
      t.string :ele4
      t.string :ele5
      t.string :ele6
      t.string :ele7
      t.string :ele8
      t.string :ele9

      t.timestamps
    end
  end

  def self.down
    drop_table :boards
  end
end
