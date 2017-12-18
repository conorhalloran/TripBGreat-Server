module V1
  class DaysController < ApplicationController

    # GET /days
    def index
      trip = Trip.find(params[:trip_id])
      days = trip.days.all.order(id: :desc)

      render json: days
    end

    # GET /days/1
    def show
      day = Day.find(params[:id])
      render json: day
    end

    # POST /days
    def create
      day = Day.new day_params
      trip = Trip.find params[:trip_id]
      day.trip = trip
      day.user = current_user

      if day.save
        render json: trip
        # render json: day, status: :created, location: day
      else
        render json: { errors: day.errors.full_messages}
        # render json: day.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /days/1
    def update
      if @day.update(day_params)
        render json: @day
      else
        render json: @day.errors, status: :unprocessable_entity
      end
    end

    # DELETE /days/1
    def destroy
      day = Day.find params[:id]
      trip = day.trip
      if bid.destroy
        render json: trip
      else
        render json: { errors: day.errors.full_messages}
      end
    end

    private

    def day_params
      params.require(:day).permit(:title, :description, :date, :start_location, :start_latitude, :start_longitude, :end_location, :end_latitude, :end_longitude, :user_id, :trip_id)
    end
  end
end
