class StripeCheckoutSessionService
  def call(event)
    job = Job.find_by(checkout_session_id: event.data.object.id)
    job.update(payment_completed: true)
  end
end
