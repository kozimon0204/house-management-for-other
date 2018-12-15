class ManageExpendablesController < ApplicationController
  before_action :authenticate_user!

  def list
    @houses = House.all
  end

  # 
  # 
  # [GET] /manage_expendables/:house_id
  # 
  def category
    @house = House.find(params[:house_id])
    @house_expenbales = HouseExpendable.where(house_id: @house.id)

    @categories = Category.all
    @expendables = Expendable.where(category_id: 1)
    @category_id = 1

  end

  # 
  # 
  # [GET] /manage_expendables/:house_id/:category_id
  # 
  def category_w
    @house = House.find(params[:house_id])
    @categories = Category.all
    @expendables = Expendable.where(category_id: params[:category_id].to_i)
    @category_id = params[:category_id].to_i

    render "manage_expendables/category"
  end

  def new
    @house = House.find(params[:house_id])
    @expendable_choices = ExpendableChoice.where(house_id: @house.id, status: ExpendableChoice.statuses[:picking])

    
  end
  
  def post
    house = House.find(params[:house_id])
    expendable_choices = ExpendableChoice.where(house_id: house.id, status: ExpendableChoice.statuses[:picking])
    zero_amount_expendable_choices = expendable_choices.where(amount: 0)
    zero_amount_expendable_choices.destroy_all

    ManageExpendableMailer.send_choice(user: current_user, house: house, expendable_choices: expendable_choices).deliver
    expendable_choices.update_all(status: ExpendableChoice.statuses[:ordered])

    redirect_to root_path
  end

  def edit
  end

  def add
  end

  
end
