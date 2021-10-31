class CreateHistoryTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :history_tickets do |t|
      t.integer :client_user_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
