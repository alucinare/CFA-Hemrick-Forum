class MessagesController < ApplicationController
    before_action :find_message, only: [:show, :edit, :update, :destroy]


  def index
    @messages = Message.all.order("created_at DESC")
    #  this will put the most recent messages at the top
  end

  def show

  end

  def new
    # current_user is a devise helper and this will create the new message of the current user. kind of like Message.new but it is associated with the current user.
    @message = current_user.messages.build
    # this is an instance variable and able to be used in the html.erb text
    
 #    Message Load (0.1ms)  SELECT  "messages".* FROM "messages" ORDER BY "messages"."id" DESC LIMIT ?  [["LIMIT", 1]]
 # => #<Message id: 3, title: "What is this going on?", description: "This is going to be a thing that we are creating", created_at: "2017-04-02 07:57:29", updated_at: "2017-04-02 07:57:29", user_id: 1>
  end

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    # this will not have a view because it'll be redirecting
    if @message.update(message_params)
      redirect_to  message_path
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path

  end

  private

    def message_params
      params.require(:message).permit(:title,:description)
    end

    def find_message
      @message = Message.find(params[:id])
    end

end
