class CreateSetups < ActiveRecord::Migration[5.1]
  def change
    create_table :setups do |t|
      t.integer :length
      t.integer :legacy_index

      t.timestamps
    end
  end
end
