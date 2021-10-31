class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :folio
      t.string :logo
      t.decimal :people
      t.float :total
      t.integer :cupon_id
      t.integer :event

      t.timestamps
    end
  end
end
