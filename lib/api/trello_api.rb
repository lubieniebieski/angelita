require 'date'
require 'trello'

class TrelloApi
  attr_reader :api, :since_date, :board_id

  def initialize(key, token, board_id, since_date = nil)
    @since_date = since_date || (Date.today - 14).to_s
    @api = Trello::Client.new(
      developer_public_key: key,
      member_token: token,
    )
    @board_id = board_id
  end

  def new_cards
    @new_cards ||= board.cards(since: since_date)
  end

  def board
    @board ||= api.find(:board, board_id)
  end
end
