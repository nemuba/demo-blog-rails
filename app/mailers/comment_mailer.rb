class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.send.subject
  #
  def send
    @greeting = "Hi"

    mail to: post.user.email
  end
end
