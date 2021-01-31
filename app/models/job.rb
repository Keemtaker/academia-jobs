class Job < ApplicationRecord
  has_rich_text :description
  has_one_attached :logo
  after_validation :set_slug, only: [:create, :update]

  validates :employer, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :job_type, presence: true
  validates :job_field, presence: true
  validates :job_application_url, presence: true
  validates :email, presence: true


  def to_param
    "#{id}-#{slug}"
  end

  def country_name
    nation = ISO3166::Country[country]
    nation.translations[I18n.locale.to_s] || nation.name
  end

  private

  def set_slug
    self.slug = title.to_s.parameterize
  end

end
