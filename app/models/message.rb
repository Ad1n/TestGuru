class Message
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :message

  validates :email, :message, presence: true

end
