class Job < ApplicationRecord
  has_rich_text :description
  has_one_attached :logo

  def country_name
    nation = ISO3166::Country[country]
    nation.translations[I18n.locale.to_s] || nation.name
  end

end
