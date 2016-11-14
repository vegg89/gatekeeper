class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:absences, :delays]
  before_action :check_days_before_paycheck, only: [:search], unless: -> { logged_in? }

  def search
    @badge_number = params[:badge_number]
    @period_entries = get_period_entries(@badge_number)
  end

  def absences
    badges = Entry.select(:badge_number).distinct.actual_period
    @absences = badges.map do |badge|
      { badge_number: badge.badge_number, period_entries: get_period_entries(badge.badge_number) }
    end
  end

  def delays
    badges = Entry.select(:badge_number).distinct.actual_period
    @delays = badges.map do |badge|
      { badge_number: badge.badge_number, period_entries: get_late_entries(badge.badge_number) }
    end
  end

  private
  def check_days_before_paycheck
    current_date = DateTime.now
    days_before_paycheck = current_date.end_of_month.mday - current_date.mday
    redirect_to root_path, notice: 'This report will be available 3 days before the payday, If you are an HR Admin, please login to access this report now.' if days_before_paycheck > 3
  end

  def get_period_entries(badge_number)
    working_days.map do |day|
      { day: day, record: Entry.by_badge_number(badge_number).by_day(day).first }
    end
  end

  def get_late_entries(badge_number)
    working_days.map do |day|
      { day: day, record: Entry.by_badge_number(badge_number).by_day(day).late.first }
    end
  end

  def working_days
    current_date = DateTime.now
    month_days =
      (1..Time.days_in_month(current_date.month, current_date.year)).select do |day|
        DateTime.new(current_date.year, current_date.month, day).on_weekday?
      end
    month_days.map { |day| DateTime.new(current_date.year, current_date.month, day)  }
  end

  def logged_in_user
    unless logged_in?
      flash[:notice] = "Please log in."
      redirect_to login_path
    end
  end
end
