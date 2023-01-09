class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :registration_code, :string
    add_column :users, :identification, :string
    add_column :users, :birth_date, :date
    add_column :users, :age, :integer
    add_column :users, :role, :integer
    add_column :users, :description, :text
  end
end
