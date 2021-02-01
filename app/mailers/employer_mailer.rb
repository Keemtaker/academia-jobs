class EmployerMailer < ApplicationMailer

  def job_post_confirmation
    @job = params[:job]
    mail(
      to:       @job.email,
      subject:  "Job Post"
    )
  end
end
