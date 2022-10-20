class PostCompleteMailer < ApplicationMailer
  def post_complete(user)
    @user = user
    mail to: @user.email, subject:"投稿完了のお知らせ"
  end
end
