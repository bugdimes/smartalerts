class Alert < ApplicationRecord
    validates :alert_type, :from, :email, presence: true
    after_create :create_slack_alert, if: :spam_notification?

    def spam_notification?
        alert_type == 'SpamNotification'
    end

    private

    def create_slack_alert
        CreateSlackAlertJob.perform_later(id)
    end
end
