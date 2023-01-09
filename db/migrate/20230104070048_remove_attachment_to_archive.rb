class RemoveAttachmentToArchive < ActiveRecord::Migration[5.2]
  def change
    remove_column :archives, :attachment
  end
end
