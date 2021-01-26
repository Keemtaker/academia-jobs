class JobsController < ApplicationController

  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result(distinct: true).order("id DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :employer, :job_type, :email, :job_application_url, :address, :country, :city, :continent, :application_deadline, :logo)
  end

end
