class CreateArchives < ActiveRecord::Migration[5.2]
  def change
    create_table :archives do |t|
      t.string :description
      t.string :attachment
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
