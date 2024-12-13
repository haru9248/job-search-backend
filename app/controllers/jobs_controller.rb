class JobsController < ApplicationController
  #POST /jobs
  def create
    job = Job.new(job_params.merge(salary: sanitize_salary(job_params[:salary])))
    if job.save
      render json: job, status: :created
    else
      render json: { errors: job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #GET /jobs
  def index
    jobs = Job.all
    render json: jobs
  end

  private

  def job_params
    params.require(:job).permit(:title, :salary, :category)
  end
  
  def sanitize_salary(salary)
    return 0 unless salary.present?

    sanitized = salary.tr('０-９', '0-9')

    sanitized.gsub!(/万円/, '')

    sanitized.to_i
  end

end
