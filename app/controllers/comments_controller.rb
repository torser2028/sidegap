class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to :back, notice: "Cambios guardados con éxito."
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to :back, notice: "Cambios guardados con éxito."
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:impact, :body, :legislative_id, :rule_id)
    end
end
