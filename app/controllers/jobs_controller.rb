class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:new_with_sign_in, :new_with_sign_up, :create]
  before_action :set_job, only: [:show, :edit, :update, :destroy, :add_image]

  def index
    @jobs = current_user.jobs
  end

  def new
    @job = Job.new
  end

  def new_with_sign_up
    @job = Job.new
    @job.user = User.new
    @new_with_user = 'sign_up'

    render :new
  end

  def new_with_sign_in
    @job = Job.new
    @job.user = User.new
    @new_with_user = 'sign_in'

    render :new
  end

  def create
    set_current_user
    @job = Job.new(job_params)
    @job.user = current_user || User.new

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_image
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
       def job_params
    params.require(:job).permit(:title, :ideal_start_date, :description, :additional_info)
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :username, :password, :password_confirmation)
  end

  def set_job
    @job = Job.find_by_id(params[:id])
    redirect_to "/" if @job.blank?
  end

  def set_current_user
    return current_user unless current_user.blank?
    unless user_params.nil?
      if user_params.has_key? :first_name
        @new_with_user = 'sign_up'
        user = User.create(user_params)
      else
        @new_with_user = 'sign_in'
        user = User.find_by_email(user_params[:email])
      end
      if !user.blank? and user.valid? and user.valid_password?(user_params[:password])
        sign_in :user, user
      end
    end
  end
  
  
  
  
end
