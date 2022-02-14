class MessagesController < ApplicationController
  def index
    @messages = Message.where(from_id: current_user.id).or(Message.where(to_id: current_user.id))
    @conversations = {}
    @users = {}

    @messages.each do |msg|
      convo_id = msg.from_id == current_user.id ? msg.to_id : msg.from_id
      if @conversations[convo_id]
        @conversations[convo_id] << msg
      else
        @conversations[convo_id] = [ msg ]
        @users[convo_id] = User.find(convo_id)
      end
    end
  end

  def convo
    @convo_id = params[:convo_id]
    @convo_partner = User.find(@convo_id)
    @messages = Message.where(from_id: current_user.id, to_id: @convo_id).or(Message.where(to_id: current_user.id, from_id: @convo_id))

    if params['commit']
      if params['content'] == ''
        flash.alert = t('alert.message_empty')
      else
        Message.create(from_id: current_user.id, to_id: params['convo_id'], content: params['content'])
      end
    end
  end
end
