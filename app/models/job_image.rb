class JobImage < ActiveRecord::Base
  belongs_to :job
  mount_uploader :photo, PhotoUploader
  validates_attachment_presence :photo
  # has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  #        :path => ":rails_root/public/assets/jobs_images/:attachment/:id_partition/:style/:basename.:extension",
  #        :url => "/assets/jobs_images/:attachment/:id_partition/:style/:basename.:extension",
  #        :default_url =>  "/assets/job_images/:style/missing.png"




validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/, :message => 'file type is not allowed (only jpeg/png/gif images)'
validates_attachment_size :photo, :less_than => 2.megabytes
 
 


end
