class PagesController < ApplicationController
  def home
    @jobs = Job.where("payment_completed = true").limit(5).order("id DESC")
  end

  def about
  end
end
