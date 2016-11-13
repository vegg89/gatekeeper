class EntriesController < ApplicationController
  before_action :check_days_before_paycheck, only: [:search]

  def search
    current_date = DateTime.now
    @badge_number = params[:badge_number]
    @period_entries = (1..Time.days_in_month(current_date.month, current_date.year)).map do |day|
      date = DateTime.new(current_date.year, current_date.month, day)
      { day: day, record: Entry.by_badge_number(@badge_number).by_day(date).first }
    end
  end

  private
  def check_days_before_paycheck
    current_date = DateTime.now
    days_before_paycheck = current_date.end_of_month.mday - current_date.mday
    redirect_to root_path, notice: 'Your report will be available 3 days before the payday' if days_before_paycheck > 3
  end
end
