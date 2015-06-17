class AddAttachmentPhotoToJobImages < ActiveRecord::Migration
  def self.up
    change_table :job_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :job_images, :photo
  end
end
