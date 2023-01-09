class AddFieldsToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :full_name, :string
    add_column :admins, :registration_code, :string
    add_column :admins, :identification, :string
    add_column :admins, :birth_date, :date
    add_column :admins, :age, :integer
    add_column :admins, :role, :integer
    add_column :admins, :description, :text
  end
end
