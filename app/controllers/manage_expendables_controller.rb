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
    @house_id = params[:house_id]
    @house_expenbales = HouseExpendable.where(house_id: params[:house_id])

    @categories = Category.all
    @expendables = Expendable.where(category_id: 1)
    @category_id = 1

  end

  # 
  # 
  # [GET] /manage_expendables/:house_id/:category_id
  # 
  def category_w
    @house_id = params[:house_id]
    @categories = Category.all
    @expendables = Expendable.where(category_id: params[:category_id])
    @category_id = params[:category_id].to_i

    render "manage_expendables/category"
  end

  def new
    @house_id = params[:house_id]
    @expendable_choices = ExpendableChoice.where(house_id: @house_id, status: ExpendableChoice.statuses[:picking])

    
  end
  
  def post
    ManageExpendableMailer.send_confirm_to_user(current_user).deliver

    redirect_to root_path
  end

  def edit
  end

  def add
  end

  
end
