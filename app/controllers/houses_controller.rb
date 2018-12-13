class HousesController < ApplicationController
  before_action :authenticate_user!

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
