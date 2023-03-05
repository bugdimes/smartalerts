
# SmartAlerts on Slack for Spam Notifictions via Web API

A Rails API Only application which have REST Endpoint to generate and save critical alerts, also supports push to Slack Channels via Slack Application

This project sends alerts asynchronously via Rails ActiveJOb using Sidekiq



## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`SLACK_API_KEY`



## Installation

Install my-project with ruby on rails

Ruby version: 3.2.1
Rails version: 7.0.4

```bash
  bundle install
  bin/rails db:setup
  bin/rails db:migrate
  bin/rails s
```

Run Sidekiq in another window, to run background jobs
```bash
  bundle exec sidekiq
```
## Usage/Examples

To successfuly send spam notification to your slack channel
```curl
curl --location 'http://localhost:3000/alerts' \
--header 'Content-Type: application/json' \
--data-raw '{
  "RecordType": "Bounce",
  "Type": "SpamNotification",
  "TypeCode": 512,
  "Name": "Spam notification",
  "Tag": "",
  "MessageStream": "outbound",
  "Description": "The message was delivered, but was either blocked by the user, or classified as spam, bulk mail, or had rejected content.",
  "Email": "zaphod@example.com",
  "From": "notifications@honeybadger.io",
  "BouncedAt": "2023-02-27T21:41:30Z",
}'
```


To Not to send and just save alert to your system
```curl
curl --location 'http://localhost:3000/alerts' \
--header 'Content-Type: application/json' \
--data-raw '{
  "RecordType": "Bounce",
  "MessageStream": "outbound",
  "Type": "HardBounce",
  "TypeCode": 1,
  "Name": "Hard bounce",
  "Tag": "Test",
  "Description": "The server was unable to deliver your message (ex: unknown user, mailbox not found).",
  "Email": "arthur@example.com",
  "From": "notifications@honeybadger.io",
  "BouncedAt": "2019-11-05T16:33:54.9070259Z"
}'
```


## Features

- REST Endpoint to send Alerts
- Alerts to Slack Channel for SPAM notifications
- Asynchronous message passing
- API only light-weight application


## TODOs

- Test Suit
- Track alerts and dashboard with monitoring using charts etc.
