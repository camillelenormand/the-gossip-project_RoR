module GossipsHelper
  def current_gossip(id)
    @gossip = Gossip.find(params[:id])
  end 
end

