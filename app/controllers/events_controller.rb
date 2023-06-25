class EventsController < ApplicationController
  before_action :set_schedule, only: %i[new create]
  def new
    @event = @schedule.events.build
  end

  def create
    @event = @schedule.events.new(event_params)
    if @event.save
      @events = @schedule.events.start_time_order
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_time, :end_time, :event_title, :image, :price, :comment)
  end

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end
