class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.all
  end

  def results
    @viewings = []
  end

  def search
    @viewings = TmdbService.new.search_movies(params[:query])

    render turbo_stream: turbo_stream.update("search_results", partial: "search_results", locals: { viewings: @viewings })
  end

  def create
    @viewing = Viewing.new(viewing_params)

    if @viewing.save
      redirect_to viewings_path, notice: "Film ajouté à votre bibliothèque !"
    else
      redirect_to viewings_path, alert: "Erreur lors de l'ajout du film."
    end
  end

  private

  def viewing_params
    params.require(:viewing).permit(:title, :poster_path, :release_date, :overview, :tmdb_id)
  end
end
