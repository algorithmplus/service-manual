class HomeController < ApplicationController
  def index
    @home = Contentful::Home.first
    @areas = @home.areas
  end
end
