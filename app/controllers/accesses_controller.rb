class AccessesController < ApplicationController
  before_action :authenticate_user!

  def index
    @accesses = Link.find(params[:format]).accesses
  end

end
