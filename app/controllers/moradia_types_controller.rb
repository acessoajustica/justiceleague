class MoradiaTypesController < ApplicationController
  authorize_resource
  def index
    @moradia = MoradiaType.all
  end

  def new
    @moradia_type = MoradiaType.new
  end

  def create
    @moradia_type = MoradiaType.new(moradia_type_params)
    respond_to do |format|
      if @moradia_type.save

        format.html { redirect_to :action => "index" , notice: 'Moradia cadastrada com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @moradia_type.errors, status: :unprocessable_entity }
      end
    end
  end
end

private

  def moradia_type_params
    params.require(:moradia_type).permit(:description, :updated_at, :created_at)
  end
