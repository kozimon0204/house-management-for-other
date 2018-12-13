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
      render json: '', status: 204
    end

  end
end
