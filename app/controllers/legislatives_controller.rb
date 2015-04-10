class LegislativesController < ApplicationController
  def index
    @legislatives = Legislative.all
  end

  def show
    @legislative = Legislative.find(params[:id])
  end
end