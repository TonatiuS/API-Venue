class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :adress
      t.string :name
      t.integer :state_id

      t.timestamps
    end
  end
end
