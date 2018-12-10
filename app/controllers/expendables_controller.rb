class ExpendablesController < ApplicationController
  def index
    @expendables = Expendable.all
  end

  def list
  end

  def new
  end

  def edit
  end
end
