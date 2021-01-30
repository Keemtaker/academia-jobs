class StripeCheckoutSessionService
  def call(event)
    job = Job.find_by(continent: event.data.object.id)
    job.update(city: 'paid')
  end
end
