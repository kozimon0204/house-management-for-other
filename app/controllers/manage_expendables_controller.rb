class ManageExpendablesController < ApplicationController
  def index
    @houses = House.all
  end

  def list
    @house_expenbales = HouseExpendable.where(house_id: params[:house_id])

  end

  def new
  end

  def edit
  end
end
