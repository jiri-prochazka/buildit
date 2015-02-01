class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :content
      t.belongs_to :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :requirements, :projects
  end
end
