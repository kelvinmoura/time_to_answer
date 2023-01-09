class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :activity_name
      t.text :description
      t.integer :points
      t.datetime :start_time
      t.datetime :end_time
      t.references :room, foreign_key: true
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
