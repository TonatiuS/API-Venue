class AddJtiToUser < ActiveRecord::Migration[6.1]
  def change
    
    add_column :users, :jti, :string
    add_index  :users, :jti, unique: true
    add_column :users, :user_type, :integer
    add_column :users, :cel, :decimal
    add_column :users, :active, :boolean
    add_column :users, :name, :string
    add_column :users, :last_name, :string
  end
end
