class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :zip
      t.string :country
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
  end
end
