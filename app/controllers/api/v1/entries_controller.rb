class Api::V1::EntriesController < ApplicationController
  protect_from_forgery with: :null_session

  def in
    entry = Entry.by_badge_number(params[:badge_number])
      .by_day(DateTime.parse(params[:datetime])).first
    if entry
      render json: "", status: 304
    else
      entry = Entry.new()
      entry.badge_number = params[:badge_number]
      entry.check_in = params[:datetime]
      entry.save
      render json: entry, status: 201
    end
  end

  def out
    # TODO: Implement Out action
  end
end
