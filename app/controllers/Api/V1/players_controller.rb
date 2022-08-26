module Api
  module V1
    class PlayersController < ApplicationController
      require 'rest-client'

      def index
        url = 'http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=basketball&response_format=JSON'
        players = RestClient.get(url)
        render json: players, status: :ok
      end

      # def show
      #   url = `http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT={sport}&response_format=JSON`
      #   player = RestClient.get(url, {params: {id:}})
      #   render json: player
      # end

      # def create 
      #   player.uuid = player_hash.fetch('id')
      #   player.first_name = player_hash.fetch('firstname')
      #   player.last_name = player_hash.fetch('lastname')
      #   player.position = player_hash.fetch('position')
      #   player.age = player_hash.fetch('age')
      # end
    end
  end
end
