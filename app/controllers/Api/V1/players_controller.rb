module Api
  module V1
    class PlayersController < ApplicationController
      require 'rest-client'
      before_action :get_data, only: %i[index show]

      def index
        get_data
      end

      def show
        @player = get_data

        keys_to_extract = [:id, :firstname, :lastname, :position, :age]

        @player.map do |p|
          @player_hash = p.select { |k,_| keys_to_extract.include? k }
        end 

        render json: @player_hash
      end

      def create
        
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

      private 
    
      def select_keys(*args)
        select {|k,_| args.include? k }
      end

      def get_data
        url = 'http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=basketball&response_format=JSON'
        players = RestClient.get(url)
        render json: players
      end
    end
  end
end
