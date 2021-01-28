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
      session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          unit_amount: 45000,
          currency: 'eur',
          product_data: {
            name: @job.title,
            images: ['https://i.imgur.com/EHyR2nP.png'],
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })

      @job.update(continent: session.id)
      redirect_to job_payment_url(@job.id)
    else
      render :new
    end
  end

  def payment
    @job = Job.find(params[:job_id])
  end

  def show
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :employer, :job_type, :email, :job_application_url, :address, :country, :city, :continent, :application_deadline, :logo)
  end

end
