class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.string :record_type
      t.string :alert_type
      t.integer :type_code
      t.string :message_stream
      t.string :name
      t.string :tag
      t.text :description
      t.string :email
      t.string :from
      t.datetime :bounced_at

      t.timestamps
    end
  end
end
