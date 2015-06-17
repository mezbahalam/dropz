class JobImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job
  before_action :set_job_image, only: []

  def new
    @job_image = @job.job_images.new
  end

  def create
    @job_image = JobImage.new(job_image_params)

    respond_to do |format|
      if @job_image.save
        format.html { redirect_to @job_image, notice: 'job Image was successfully created.' }
        format.json { render :json => "Saved successfully.".to_json, status: :created }
      else
        format.html { render :new }
        format.json { render :json => "Unsupported extention".to_json, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_job
      @job = Job.find_by_id(params[:job_id])
    end

    def set_job_image
      @job_image = @job.job_images.where("id = ?", params[:id]).first
    end

    def job_image_params
      params.require(:job_image).permit(:job_id, :photo)
    end
end
