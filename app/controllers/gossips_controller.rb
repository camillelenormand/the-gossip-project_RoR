class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def show
    @id = params[:id]
  end

end
