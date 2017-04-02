class CommentsController < ApplicationController
  before_action :find_message
  before_action :find_comment, only: [:edit, :update, :destroy]
  # this gives us the ability to create a comment in respect to the current user.
  def create
    # finding the message
    # @message = Message.find(params[:message_id])
    # creating the comment in relation to that message.
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.id
    # tis will save the comment and test if it has been saved, redirecting it to the current message so it'll show the comment underneath the message.
    if @comment.save
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  def edit
    # to edit something we have to find it first because this is a separate action that is happening in relation to all the other actions
    # this finds the current message by using the params

  end

  def update

    if @comment.update(comment_params)
      redirect_to message_path(@message)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    # head back to the message path in respect to where the message was in. This is where the functionality ends 1:18 hr:min
    redirect_to message_path(@message)
  end

  private

    def comment_params
      # name of the model and the attribute
      params.require(:comment).permit(:content)

    end

    def find_message
      @message = Message.find(params[:message_id])
    end

    def find_comment
      @comment = @message.comments.find(params[:id])
    end

end
