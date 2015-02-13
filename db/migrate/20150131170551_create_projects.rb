class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :estimated_finish
      t.datetime :completed_at
      t.boolean :archived, default: false

      t.timestamps null: false
    end
  end
end
