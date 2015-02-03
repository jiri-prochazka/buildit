class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", unique: true
      t.string :encrypted_password, null: false, default: ""

      ## Lockable
       t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
       t.string   :unlock_token # Only if unlock strategy is :email or :both
       t.datetime :locked_at

       #Inheritance attribute
       t.string :type
       #Common attributes
       t.string :name
       t.string :surname
       t.string :phone
      
       #Employee
       t.datetime :employed_since
       t.boolean :admin
       t.string :position

       #Customer
       t.string :salutation
       t.string :nationality
       t.boolean :newsletter

      t.timestamps
    end

    #add user to concept
    add_reference :concepts, :user, index: true
    add_foreign_key :concepts, :users

    #add customer to project
    add_reference :projects, :customer, index: true
    add_foreign_key :projects, :users, column: :customer_id
    #add customer to requirements
    add_reference :requirements, :customer, index: true
    add_foreign_key :requirements, :users, column: :customer_id

    #add employee to project
    add_reference :projects, :employee, index: true
    add_foreign_key :projects, :users, column: :employee_id
    #add employee to job
    add_reference :jobs, :employee, index: true
    add_foreign_key :jobs, :users, column: :employee_id
    #add employee to attachment
    add_reference :attachments, :employee, index: true
    add_foreign_key :attachments, :users, column: :employee_id

    add_index :users, :email,                unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
