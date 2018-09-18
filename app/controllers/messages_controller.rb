class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.feedback(@message).deliver_now
      redirect_to new_message_url
      flash[:success] = "We have received your message and will be in touch soon!"
    else
      flash[:alert] = "There was an error sending your message. Please try again."
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :message)
  end
end
