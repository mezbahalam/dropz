json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :ideal_start_date, :completed_on, :description, :additional_info, :featured, :image, :user_id
  json.url job_url(job, format: :json)
end
