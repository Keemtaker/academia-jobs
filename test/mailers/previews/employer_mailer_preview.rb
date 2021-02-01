# Preview all emails at http://localhost:3000/rails/mailers/employer_mailer
class EmployerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employer_mailer/job_post_confirmation
  def job_post_confirmation
    EmployerMailer.job_post_confirmation
  end

end
