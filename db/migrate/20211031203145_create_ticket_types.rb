class CreateTicketTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_types do |t|
      t.integer :type
      t.float :total_limit
      t.float :total_leftover
      t.integer :event_id
      t.float :cost

      t.timestamps
    end
  end
end
