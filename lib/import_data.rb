class Import
  require 'rest-client'
  
  def get_data
    url = 'http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=basketball&response_format=JSON'
    players = RestClient.get(url)
    player_hash = JSON.parse(players)
    create_player(player_hash)
  end

  def create_player(player_hash)
    player = Player.new
    player.uuid = player_hash.fetch('id')
    player.first_name = player_hash.fetch('firstname')
    player.last_name = player_hash.fetch('lastname')
    player.position = player_hash.fetch('position')
    player.age = player_hash.fetch('age')

    if player.save
      "players created sucessfully"
    else
      "players was not created"
    end
  end
end
