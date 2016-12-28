class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)

    respond_to do |format|
      if @comment.save!
        CommentsMailer.teacher_request_comment(@comment, @comment.teacher_request).deliver_now
        format.html { redirect_to @comment.teacher_request, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      end
    end
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params
      .require(:comment)
      .permit(
        :user_id,
        :body,
        :teacher_request_id,
      )
  end
end
