class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.string :name, null: false
      t.float :amount, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
