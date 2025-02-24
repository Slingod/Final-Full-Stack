class Photo < ApplicationRecord
  belongs_to :event

  # Scope pour filtrer par année et mois
  scope :by_year_and_month, ->(year, month) {
    where("strftime('%Y', date_taken) = ? AND strftime('%m', date_taken) = ?", year.to_s, month.to_s)
  }
end
