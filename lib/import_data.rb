require 'json'
require 'uri'

module PlayerList
  class Import
    def call
      IO.foreach(Rails.root.join('tmp/player_list.json')) do |player_list|
        player_hash = JSON.parse(player_list)
        create_player(player_hash)
      end
    end

    private

    def create_player(player_hash)
      player = Player.new
      player.uuid = player_hash.fetch('id')
      player.first_name = player_hash.fetch('firstname')
      player.last_name = player_hash.fetch('lastname')
      player.position = player_hash.fetch('position')
      player.age = player_hash.fetch('age')


      if player.save
        "player #{player_hash['id']}created"
      else
        "player #{player_hash['id']} was not created"
      end
    end
  end
end
