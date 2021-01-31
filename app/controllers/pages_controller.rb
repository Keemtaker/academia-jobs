class PagesController < ApplicationController
  def home
    @jobs = Job.all.limit(5).order("id DESC")
  end

  def about
  end
end
