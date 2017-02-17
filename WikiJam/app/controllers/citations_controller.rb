class CitationsController < ApplicationController

  def index
    @citations = Citation.all
  end

end
