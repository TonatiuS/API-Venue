class CreateClientUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :client_users do |t|
      t.decimal :card
      t.datetime :date_card
      t.decimal :cv
      t.integer :history_ticket_id
      t.integer :user_id

      t.timestamps
    end
  end
end
