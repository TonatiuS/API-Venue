class FixColumnCupon < ActiveRecord::Migration[6.1]
  def up
    add_column :cupons, :usos, :decimal
  end
end
