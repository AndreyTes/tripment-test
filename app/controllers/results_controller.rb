class ResultsController < ApplicationController
  def index
    @search_results = Procedure.where('title ILIKE ?', "%#{params[:query]}%")
                               .order("CASE WHEN (title ILIKE '#{params[:query]}%') THEN 0 ELSE 1 END")
  end
end
