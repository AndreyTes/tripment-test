class ProceduresController < ApplicationController
  def index
    render json: Procedure.search(params[:query])
  end
end
