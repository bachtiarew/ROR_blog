class CommentsController < ApplicationController
  http_basic_authenticate_with name: "tiar", password: "terserah", only: :destroy
  #http_basic_authenticate_with name:"tiar", password: "iyalah, except: :show"
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.find(params[:id])
    # @comment.destroy

    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.destroy
    redirect_to article_path(@comment.article)
  end


  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
