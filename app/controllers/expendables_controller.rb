class ExpendablesController < ApplicationController
  def index
    @expendables = Expendable.all.order(:id)
  end


  # 
  # 
  # [GET] /expendables/:id
  # 
  def show
    @expendable = Expendable.find(params[:id])

  end

  def list
  end

  def new
    @expendable = Expendable.new
    @categories = Category.all

  end


  # 
  # 
  # [GET] /expendables/:id/edit
  # 
  def edit
    @expendable = Expendable.find(params[:id])

  end

  # 
  # 
  # [POST] /expendables
  # 
  def create
    expendable = Expendable.create(expendable_params)
    if expendable.present?
      redirect_to '/expendables/' + expendable.id.to_s

    else
      render 'edit'

    end

  end

  # 
  # 
  # [POST] /expendables
  # 
  def update
    expendable = Expendable.find(expendable_params[:id])
    
    if expendable.update_attributes(expendable_params)
      redirect_to '/expendables/' + expendable.id.to_s

    else
      render 'edit'
    end

  end

  private
  def expendable_params
    params.require(:expendable).permit(:id, :category_id, :display_number, :expendable_type,
                                  :name, :img, :url, :price, :requier_number)
  end
end
