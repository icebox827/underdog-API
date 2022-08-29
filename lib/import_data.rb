class Import
  require 'rest-client'

  def get_data.self
    url = 'http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=basketball&response_format=JSON'
    players = RestClient.get(url)
    player_hash = JSON.parse(players)
    create_player(player_hash)
  end

  def create_player(player_hash)
    player = Player.new
    player.first_name = player_hash.fetch('firstname')
    player.last_name = player_hash.fetch('lastname')
    player.position = player_hash.fetch('position')
    player.age = player_hash.fetch('age')

    if player.save
      render json: { message: 'players created sucessfully' }, status: :ok
    else
      render json: { error: player.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
