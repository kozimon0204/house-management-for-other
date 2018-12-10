class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def list
  end

  def new
  end

  def edit
  end
end
