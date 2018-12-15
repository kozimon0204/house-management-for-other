class ManageExpendableMailer < ApplicationMailer

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end

  def send_choice(user: , house: , expendable_choices:)
    @user = user
    @house = house
    @expendable_choices = expendable_choices

    mail(
      subject: "消耗品発注リスト【#{@house.name}】", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end

end

