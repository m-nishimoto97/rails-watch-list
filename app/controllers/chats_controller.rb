class ChatsController < ApplicationController
  def index
    @chats = Chats.all
  end
end
