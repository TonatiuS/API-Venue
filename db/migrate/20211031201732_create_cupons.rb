class CreateCupons < ActiveRecord::Migration[6.1]
  def change
    create_table :cupons do |t|
      t.string :code
      t.float :average
      t.float :total

      t.timestamps
    end
  end
end
