class CreateCategoryOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :category_operations do |t|
      t.references :category, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true

      t.timestamps
    end

    add_index :category_operations, [:category_id, :operation_id], unique: true
  end
end
