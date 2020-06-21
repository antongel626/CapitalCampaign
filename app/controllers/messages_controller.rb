class MessagesController < InheritedResources::Base

  private

    def message_params
      params.require(:message).permit(:from, :content, to: [], to_users: [], to_teams: [])
    end
end

