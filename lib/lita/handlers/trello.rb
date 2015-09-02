require_relative '../../api/trello_api'
require_relative '../../text_helper'

module Lita
  module Handlers
    class Trello < Handler
      template_root File.expand_path('../../templates', __FILE__)

      config :key, type: String, required: true
      config :token, type: String, required: true
      config :board_id, type: String, required: true

      route /^trello news/, command: true, help: { "trello news" => "Get the latest news from BestPractices board" } do |response|
        response.reply("We have #{api.new_cards.count} new card(s):")
        api.new_cards.each do |card|
          response.reply render_template_with_helpers(:trello_card, [TextHelper], card: card)
        end
      end

      private

      def api
        @api ||= TrelloApi.new(config.key, config.token, config.board_id)
      end
    end

    Lita.register_handler(Trello)
  end
end
