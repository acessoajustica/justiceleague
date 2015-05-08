class CalourosController < ApplicationController
  before_action :set_calouro, only: [:show, :edit, :update, :destroy]

  # GET /calouros
  # GET /calouros.json
  def index
    @calouros = Calouro.all
  end

  # GET /calouros/1
  # GET /calouros/1.json
  def show
  end

  # GET /calouros/new
  def new
    @calouro = Calouro.new
    @user_id = params[:user_id]
  end

  # GET /calouros/1/edit
  def edit
  end

  # POST /calouros
  # POST /calouros.json
  def create
    @calouro = Calouro.new(calouro_params.select {|key, value| key != 'user_id'})

    respond_to do |format|
      if @calouro.save
        @user = User.find(calouro_params[:user_id])
        @user.membro_id = Membro.find_by({:actable_type => "Calouro", :actable_id => @calouro.id}).id;
        @user.save
        format.html { redirect_to @calouro, notice: 'Calouro was successfully created.' }
        format.json { render :show, status: :created, location: @calouro }
      else
        format.html { render :new }
        format.json { render json: @calouro.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @membro = Membro.new(membro_params.select { |key, value| key != 'user_id' } )
  #   respond_to do |format|
  #     if @membro.save
  #       @user = User.find(membro_params[:user_id])
  #       @user.membro_id = @membro.id
  #       @user.save
  #       format.html { redirect_to @membro, notice: 'Membro was successfully created.' }
  #       format.json { render :show, status: :created, location: @membro }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @membro.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /calouros/1
  # PATCH/PUT /calouros/1.json
  def update
    respond_to do |format|
      if @calouro.update(calouro_params.select {|key, value| key != user_id})
        format.html { redirect_to @calouro, notice: 'Calouro was successfully updated.' }
        format.json { render :show, status: :ok, location: @calouro }
      else
        format.html { render :edit }
        format.json { render json: @calouro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calouros/1
  # DELETE /calouros/1.json
  def destroy
    @calouro.destroy
    respond_to do |format|
      format.html { redirect_to calouros_url, notice: 'Calouro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calouro
      @calouro = Calouro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calouro_params
      params.require(:calouro).permit(:ano_faculdade, :nome, :cpf, :nome_da_mae, :rg, :cor, :identidade_de_genero, :user_id)
    end

end
