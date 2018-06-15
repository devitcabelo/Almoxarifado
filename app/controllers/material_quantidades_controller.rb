class MaterialQuantidadesController < ApplicationController
  before_action :set_material_quantidade, only: [:show, :edit, :update, :destroy]

  # GET /material_quantidades
  # GET /material_quantidades.json
  def index
    @material_quantidades = MaterialQuantidade.all
  end

  # GET /material_quantidades/1
  # GET /material_quantidades/1.json
  def show
  end

  # GET /material_quantidades/new
  def new
    @material_quantidade = MaterialQuantidade.new
  end

  # POST /material_quantidades
  # POST /material_quantidades.json
  def create
    byebug
    @material_quantidade = MaterialQuantidade.new(material_quantidade_params)

    respond_to do |format|
      if @material_quantidade.save
        format.html { redirect_to @material_quantidade, notice: 'Material quantidade was successfully created.' }
        format.json { render :show, status: :created, location: @material_quantidade }
      else
        format.html { render :new }
        format.json { render json: @material_quantidade.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_quantidade
      @material_quantidade = MaterialQuantidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_quantidade_params
      params.require(:material_quantidade).permit(:material_id, :quantidade)
    end
end
