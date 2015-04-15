class LegislativesController < ApplicationController
  def index
    @q = Legislative.ransack(params[:q])
    @legislatives = @q.result
  end

  def show
    @legislative = get_legislative(params[:id])
  end

  def events

  end

  def follow
    @legislative = get_legislative(params[:id])
    current_user.follow(@legislative)
    redirect_to :back
  end

  def unfollow
    @legislative = get_legislative(params[:id])
    current_user.stop_following(@legislative)
    redirect_to :back
  end

  def dislike
    @legislative = get_legislative(params[:id])
    current_user.dislikes(@legislative)
    redirect_to :back
  end

  def like
    @legislative = get_legislative(params[:id])
    current_user.likes(@legislative)
    redirect_to :back
  end

  def favorites
    @q = current_user.following_legislatives.ransack(params[:q])
    @legislatives = @q.result
  end

  def trash
    @q = Legislative.ransack(params[:q])
    @legislatives = []
    @q.result.each do |item|
      @legislatives << item if current_user.find_disliked_items.include?(item)
    end
  end

  def stakeholders
  end

  private
    def get_legislative(id)
      Legislative.find(id)
    end
end