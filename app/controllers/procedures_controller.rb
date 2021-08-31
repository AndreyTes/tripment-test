class ProceduresController < ApplicationController
  def index
    render json: Procedure.search(params[:query])
  end

  def new
    render template: "procedures/new"
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      flash[:success] = "Procedure '#{@procedure.title}' has been created!"
    else
      flash[:danger] = "Errors: #{@procedure.errors.full_messages.join(', ')}"
    end
    redirect_to root_path
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    flash[:success] = "Procedure '#{@procedure.title}' has been deleted!"
    redirect_to root_path
  end

  private

  def procedure_params
    params.require(:procedure).permit(:title)
  end
end
