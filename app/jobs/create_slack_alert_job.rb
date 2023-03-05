class CreateSlackAlertJob < ApplicationJob
  queue_as :default

  def perform(alert_id)
    alert = Alert.find(alert_id)
    message = "Hello World, This is a SPAM Notification from email: #{alert.from} email: #{alert.email}"
    slack_client ||= Slack::Web::Client.new
    slack_client.chat_postMessage(channel: '#alerts', text: message)
  end
end
