class LegislativesController < ApplicationController
  def index
    @q = Legislative.ransack(params[:q])
    @legislatives = @q.result
  end

  def show
    @legislative = Legislative.find(params[:id])
  end

  def events

  end
end