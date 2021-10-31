class CreateDateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :date_venues do |t|
      t.datetime :date_venue
      t.boolean :availability

      t.timestamps
    end
  end
end
