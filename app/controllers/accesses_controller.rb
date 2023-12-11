class AccessesController < ApplicationController

  def index
    # puts "Los parametros son: #{params[:format]}"
    @accesses = Link.find(params[:format]).accesses
  end

end
