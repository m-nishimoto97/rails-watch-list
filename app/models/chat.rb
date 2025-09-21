class Chat < ApplicationRecord
  acts_as_chat

  has_many :messages, dependent: :destroy
end
