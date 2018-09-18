class MessageMailer < ApplicationMailer

  def feedback(message)
    @user = message.name
    @email = message.email
    @subject = message.subject
    @send_message = message.message
    mail to: "shevtsovav@bk.ru", subject: "Feedback from #{@email}"
  end

end
