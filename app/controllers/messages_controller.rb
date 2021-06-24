class MessagesController < ApplicationController

    def text
        @singers = Singer.order(active: :desc, first_name: :asc)

        render :text_form
      end
    
      def send_text
        account_sid = Rails.application.credentials.twilio[:account_sid]
        auth_token = Rails.application.credentials.twilio[:auth_token]
        client = Twilio::REST::Client.new(account_sid, auth_token)
    
        params["recipient"]["ids"].reject(&:empty?).each do |id|
          singer = Singer.find_by(id: id)
          from = Rails.application.credentials.twilio[:phone_number]
          to = singer.phone_number
          message = params["message"].gsub("{FIRSTNAME}", singer.first_name)
          if send_text? # set on ApplicationController
            client.messages.create(
              from: from,
              to: to,
              body: message
              )
          else
            print(
              """
                To:  #{to}\n
                From: #{from}\n
                Message: #{message}\n
              """
            )
            end
        end
        flash[:notice] = "Message sent successfully."
        redirect_to singers_path
      end
      
end
