class Api::V1::StoriesController < ApplicationController
  decorates_assigned :story

  def index
    @stories = StoryDecorator.decorate_collection(Story.latest)
    render json: @stories
  end
end
