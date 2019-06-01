class EventsController < ApplicationController
  before_action :auth

  include JSONAPI::ActsAsResourceController
end
