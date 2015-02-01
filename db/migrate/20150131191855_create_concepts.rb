class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :name
      t.decimal :price
      t.datetime :start_at
      t.datetime :end_at
      t.text :description

      t.timestamps null: false
    end
    add_reference :projects, :concept, index: true
    add_foreign_key :projects, :concepts
  end
end
