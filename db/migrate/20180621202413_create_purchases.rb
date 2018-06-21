class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.string :size
      t.string :strength
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :brew, foreign_key: true

      t.timestamps
    end
  end
end
