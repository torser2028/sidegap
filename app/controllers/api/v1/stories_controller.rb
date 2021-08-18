class Api::V1::StoriesController < ApplicationController
  skip_before_filter :authenticate_user!
  decorates_assigned :story

  def index
    @stories = StoryDecorator.decorate_collection(Story.latest)
    render json: @stories
  end
end
