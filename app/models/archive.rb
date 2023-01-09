class Archive < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader

  belongs_to :activity, inverse_of: :archives
end
