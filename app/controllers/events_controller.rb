class EventsController < ApplicationController

  def follow
    @event = get_event params[:id]
    current_user.follow @event
    redirect_to :back
  end

  def unfollow
    @event = get_event params[:id]
    current_user.stop_following @event
    redirect_to :back
  end

  private
    def get_event(id)
      Event.find id
    end
end
