module Api 
  module V1
    class PlayersController < ApplicationController
      def index
        @players = player.all
      end

      def show
        @player = PlayerList::Import.find(params[:id])
      end
    end
  end
end
