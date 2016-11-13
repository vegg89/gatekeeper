class Entry < ApplicationRecord
  validates :badge_number, presence: true, length: { is: 10 }, numericality: { only_integer: true }

  scope :not_checked_out, -> { where(check_out: nil) }
  scope :by_badge_number, ->(badge_number) { where(badge_number: badge_number) }
  scope :by_day, ->(entry_date) { where("check_in BETWEEN ? AND ?", entry_date.beginning_of_day, entry_date.end_of_day) }
  scope :actual_period, -> { where("check_in BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now.end_of_month)  }

end
