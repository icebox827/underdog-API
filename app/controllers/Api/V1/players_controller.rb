module Api
  module V1
    class PlayersController < ApplicationController
      def show
        player = Player.find(params[:id])
        render json: player
      end
    end
  end
end
