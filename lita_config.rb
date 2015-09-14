require 'app_konfig'
require_relative 'lib/lita/handlers/trello'
require_relative 'lib/lita/handlers/github'

Lita.configure do |config|
  config.robot.name = "Angelita"
  config.robot.log_level = :info
  config.robot.adapter = :slack

  # Adapters

  config.adapters.slack.token  = AppConfig.slack.token

  # Handlers

  config.handlers.trello.token = AppConfig.trello.token
  config.handlers.trello.key = AppConfig.trello.access_key
  config.handlers.trello.board_id = AppConfig.trello.board_id
  config.handlers.github.organization_name = AppConfig.github.organization_name
end
