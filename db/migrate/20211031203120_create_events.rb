class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :limit
      t.string :description
      t.integer :place_id
      t.integer :date_venue
      t.integer :venue_type
      t.boolean :active

      t.timestamps
    end
  end
end
