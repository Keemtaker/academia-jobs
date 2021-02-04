class JobsController < ApplicationController

  def index
    @search = Job.where("payment_completed = true").ransack(params[:q])
    @jobs = @search.result(distinct: true).order("id DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          unit_amount: 100,
          currency: 'eur',
          product_data: {
            name: @job.title,
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: "#{success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: "#{cancel_url}?session_id={CHECKOUT_SESSION_ID}",
    })

      @job.update(checkout_session_id: session.id)
      redirect_to job_payment_url(@job.id)
    else
      render :new
    end
  end

  def payment
    @job = Job.find(params[:job_id])
  end

  def show
    @job = Job.find(params[:id])
  end

  def success
    @job = Job.find_by(checkout_session_id: params[:session_id])
    mail = EmployerMailer.with(job: @job).job_post_confirmation
    mail.deliver_now
    redirect_to job_path(@job)
    flash[:notice] = "You have successfully posted a Job and confirmation details will be sent to #{@job.email}"
  end

  def cancel
    @job = Job.find_by(checkout_session_id: params[:session_id])
    redirect_to root_path
    flash[:alert] = "The Job posting did not complete successfully. You can try again or contact us at info@academiajobs.page for support"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :employer, :job_type, :email, :job_application_url, :address, :country, :city, :continent, :application_deadline, :job_field, :logo)
  end

end
