class CreateAdminUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_users do |t|
      t.string :contrato
      t.integer :user_id

      t.timestamps
    end
  end
end
