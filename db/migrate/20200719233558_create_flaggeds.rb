class CreateFlaggeds < ActiveRecord::Migration[6.0]
  def change
    create_table :flaggeds do |t|
      t.references :workout, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true

      t.timestamps
    end
  end
end
