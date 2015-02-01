class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.belongs_to :job, index: true

      t.timestamps null: false
    end
    add_foreign_key :attachments, :jobs
  end
end
