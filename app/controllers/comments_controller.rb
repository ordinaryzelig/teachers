class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create!(comment_params)
    respond_to do |format|
      @comment.users_to_email.each do |user|
        CommentsMailer.teacher_request_comment(@comment, user).deliver_later
      end
      format.html { redirect_to @comment.teacher_request, notice: 'Comment was successfully created.' }
      format.json { render :show, status: :created, location: @comment }
    end
  end

private

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
