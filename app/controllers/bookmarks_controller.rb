class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.summary = movie_summary(@bookmark)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_content
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id, :summary)
  end

  def movie_summary(bookmark)
    prompt = <<-PROMPT
      Please give me a short summary about the movie #{bookmark.movie.title}
      Please keep it around 50 words.
    PROMPT
    RubyLLM.chat.ask(prompt).content
  end
end
