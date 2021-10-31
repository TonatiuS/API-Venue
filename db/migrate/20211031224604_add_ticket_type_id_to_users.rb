class AddTicketTypeIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ticket_type_id, :integer
  end
end
