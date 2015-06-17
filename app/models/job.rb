class Job < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :job_images, :dependent => :destroy

  # Validations
  validates  :title, :ideal_start_date, :description, :additional_info, :user_id, presence: true

  accepts_nested_attributes_for :user, reject_if: :all_blank
end
