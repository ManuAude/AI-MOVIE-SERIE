class ViewingsController < ApplicationController

  def index
    @viewings = []
  end

 def search
    @viewings = TmdbService.new.search_movies(params[:query])

    respond_to do |format|
      format.turbo_stream
      format.html { render partial: 'results', locals: { viewings: @viewings } }
    end
  end
end
