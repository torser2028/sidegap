class WelcomeController < ApplicationController
  def index
    @stories = Story.latest
  end
end
