class EventsController < ApplicationController
  def index
    Event.all
  end

  def new
  end
end
