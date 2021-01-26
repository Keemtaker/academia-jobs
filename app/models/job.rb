class Job < ApplicationRecord
  has_rich_text :description
  has_one_attached :logo

end
