class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.references :author, index: true

      t.timestamps
    end
    add_foreign_key :expenses, :users, column: :author_id
  end
end
