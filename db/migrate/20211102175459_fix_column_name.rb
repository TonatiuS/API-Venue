class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :tickets, :event, :event_id
    rename_column :ticket_types, :type, :type_class
    
  end

  def up
    add_column :events, :limit_persons, :decimal
  end
end
