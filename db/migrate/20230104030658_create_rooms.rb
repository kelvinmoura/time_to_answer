class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :description
      t.string :code
      t.string :password
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
