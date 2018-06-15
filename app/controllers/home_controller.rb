class HomeController < ApplicationController
  def index
    @existe_material = Material.all.any?
  end
end