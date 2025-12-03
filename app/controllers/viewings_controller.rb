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
    viewing_attrs = viewing_params.to_h.compact
    @viewing = Viewing.find_or_initialize_by(tmdb_id: viewing_attrs["tmdb_id"])
    @viewing.assign_attributes(viewing_attrs)

    if @viewing.save
      @user_viewing = UserViewing.new(user: current_user, viewing: @viewing)

      if @user_viewing.save
        redirect_to viewings_path, notice: "Film ajouté à votre bibliothèque !"
      else
        movie_title = viewing_params[:title].presence || @viewing&.title || "Ce film"
        flash.now[:alert] = "\"#{movie_title}\" est déjà dans votre bibliothèque."
        render :results, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Impossible d'ajouter ce film pour le moment."
      render :results, status: :unprocessable_entity
    end
  end

  private

  def viewing_params
    params.require(:viewing).permit(:title, :poster_path, :release_date, :overview, :tmdb_id)
  end
end
