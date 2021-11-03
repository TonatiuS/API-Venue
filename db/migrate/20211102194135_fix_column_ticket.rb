class FixColumnTicket < ActiveRecord::Migration[6.1]
  def up
    add_column :tickets, :ticket_type_id, :integer
  end
end
