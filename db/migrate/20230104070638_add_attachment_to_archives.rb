class AddAttachmentToArchives < ActiveRecord::Migration[5.2]
  def change
    add_column :archives, :attachment, :string
  end
end
