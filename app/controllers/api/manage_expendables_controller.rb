module Api
  class ManageExpendablesController < ApiController
    
    # 
    # 注文履歴一覧
    # 
    # ログイン情報からユーザーIDを取得し、
    # 紐づく注文履歴一覧を取得
    # 
    # [POST] /api/manage_expendables/add
    # 
    def add
      expendableChoice = ExpendableChoice.find_by(house_id: expendable_params[:house_id], expendable_id: expendable_params[:expendable_id], status: ExpendableChoice.statuses[:picking])
      if expendableChoice.present?
        expendableChoice.amount += 1
        expendableChoice.save!
        
      else
        expendableChoice = ExpendableChoice.new(expendable_params)
        expendableChoice.status = ExpendableChoice.statuses[:picking]
        expendableChoice.amount = 1
        expendableChoice.save!

      end 

      

      render json: '', status: 204
    end

    # 
    # 足す
    # 
    # [PUT] /api/manage_expendables/plus
    # 
    def plus
      expendableChoice = ExpendableChoice.find(expendable_choice_params[:id])
      expendableChoice.amount += 1
      expendableChoice.save!

      render json: '', status: 204
    end

    # 
    # 引く
    # 
    # [PUT] /api/manage_expendables/minus
    # 
    def minus
      expendableChoice = ExpendableChoice.find(expendable_choice_params[:id])
      expendableChoice.amount -= 1
      expendableChoice.save!

      render json: '', status: 204
    end

    private
    def expendable_params
      params.require(:expendable).permit(:house_id, :expendable_id)
    end

    def expendable_choice_params
      params.require(:expendable_choice).permit(:id)
    end

  end
end
