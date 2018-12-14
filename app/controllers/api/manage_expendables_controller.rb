module Api
  class ManageExpendablesController < ApiController
    
    # 
    # 注文履歴一覧
    # 
    # ログイン情報からユーザーIDを取得し、
    # 紐づく注文履歴一覧を取得
    # 
    # [GET] /api/v1/app/slips
    # 
    def add
      expendableChoice = ExpendableChoice.new(expendable_params)
      expendableChoice.status = ExpendableChoice.statuses[:picking]
      expendableChoice.amount = 1
      expendableChoice.save!

      render json: '', status: 204
    end

    private
    def expendable_params
      params.require(:expendable).permit(:house_id, :expendable_id)
    end

  end
end
