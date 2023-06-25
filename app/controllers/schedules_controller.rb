class SchedulesController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :set_schedule, only: %i[show]
  def index
    @schedules = Schedule.preload(%i[user])
  end

  def show
    @events = @schedule.events.start_time_order
  end

  def new
    @schedule = current_user.schedules.build
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, success: t('.success', title: @schedule.schedule_title)
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:schedule_title, :assumed_number_people, :get_up_time, :sleep_time)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
