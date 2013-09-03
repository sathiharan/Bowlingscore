class CreateBowlings < ActiveRecord::Migration
  def change
    create_table :bowlings do |t|
      t.string :ball
      t.string :score
      t.string :total

      t.timestamps
    end
  end
end
