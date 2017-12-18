module V1
  class TripsController < ApplicationController
    
    def index
      @trips = Trip.all.order(created_at: :desc)
      # @trips = Trip.where(aasm_state: [:published, :in_progress]).order(created_at: :desc)

      render json: @trips
    end

    
    def show
      trip = Trip.find params[:id]
      render json: trip
    end

  
    def create
      
      trip = Trip.new(trip_params)
      trip.user = current_user
      if trip.save
        render json: trip
      else
        render json: { errors: trip.errors.full_messages}
      end
    end

    def update
      trip = Trip.find params[:id]
      if params.include?("aasm_state")
        trip.publish!
        render json: trip
      elsif (trip.user == current_user) && trip.update(trip_params)
        render json: trip
      else
        render json: { errors: trip.errors.full_messages}
      end
    end

    def destroy
      trip = Trip.find params[:id]
      if (trip.user == current_user) && trip.destroy
        render json: { success: true }
      else
        render json: { errors: trip.errors.full_messages}
      end
    end

    private

      def trip_params
        params.require(:trip).permit(:title, :description, :location, :start_date, :end_date, :duration, :user_id, :aasm_state, :latitude, :longitude)
      end
  end
end
