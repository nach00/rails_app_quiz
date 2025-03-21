class JobsController < ApplicationController
  # GET /jobs
  def index
    @jobs = Job.all
    render json: @jobs
  end

  # GET /jobs/:id
  def show
    @job = Job.find(params[:id])
    render json: @job
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Job not found' }, status: :not_found
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created
    else
      render json: { errors: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through
  def job_params
    params.require(:job).permit(
      :url, 
      :employer_name, 
      :employer_description, 
      :job_title, 
      :job_description, 
      :year_of_experience, 
      :education_requirement, 
      :industry, 
      :base_salary, 
      :employment_type_id
    )
  end
end
