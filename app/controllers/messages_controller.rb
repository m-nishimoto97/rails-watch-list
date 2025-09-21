class MessagesController < ApplicationController
  prompt = <<-PROMPT
    You are a chatbox to help users find movies they would like
    I am a user who likes movie
    Give me a list of a few movies that I would what I am interested in
    Give them in a list with a short summary attached.
    PROMPT

  def create
    @chat = Chat.find_by(id: params[:chat_id])

    if @chat.nil?
      @chat = Chat.create
    end

    @message = @chat.messages.new(message_params)
    @message.role = "user"

    if @message.save
      @chat = RubyLLM.chat(messages: @chat.messages.map(&:as_json))
      @response = chat.with_instructions(prompt).ask(@message.content)
      @ai_message = @chat.messages.new(content: @response.content, user: "ai")
      @ai_message.save

      respond_to do |format|
        format.json { render json: { chat_id: @chat.id, user_message: @message.content, ai_message: @ai_message.content } }
      end

  private

  def message_params
    params.require(:messages),permit(:content)
  end
end
