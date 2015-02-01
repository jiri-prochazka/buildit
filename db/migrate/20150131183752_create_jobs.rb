class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.datetime :confirmed_at
      t.integer :progress
      t.integer :estimated_time
      t.decimal :estimated_price
      t.decimal :real_price
      t.datetime :completed_at
      t.belongs_to :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :jobs, :projects
  end
end
