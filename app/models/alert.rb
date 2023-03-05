class Alert < ApplicationRecord
    validates :alert_type, :from, :email, presence: true
end
