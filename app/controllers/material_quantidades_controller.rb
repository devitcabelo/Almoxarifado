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

  # GET /material_quantidades/new/:acao
  def new
    @material_quantidade = MaterialQuantidade.new
    @labels = DefineLabelService.label_for_material_quantidade params
  end

  # POST /material_quantidades/registrar/:acao
  # POST /material_quantidades.json
  def registrar
    @material_quantidade = MaterialQuantidade.find_by(material_id: material_quantidade_params[:material_id])
    nova_quantidade = @material_quantidade.nova_quantidade params[:acao], material_quantidade_params[:quantidade].to_i if @material_quantidade.present?

    respond_to do |format|
      if @material_quantidade.present? && @material_quantidade.update_attributes(quantidade: nova_quantidade)
        Registro.create(usuario_id: current_usuario.id, material_id: @material_quantidade.material_id, quantidade: material_quantidade_params[:quantidade], acao: params[:acao])
        notice = params[:acao].to_s.capitalize + ' de materiais cadastrada com sucesso.'
        format.html { redirect_to material_quantidades_path, notice: notice }
        format.json { render :show, status: :created, location: @material_quantidade }
      else
        @labels = DefineLabelService.label_for_material_quantidade params
        if @material_quantidade.present?
          format.html { render :new }
          format.json { render json: @material_quantidade.errors, status: :unprocessable_entity }
        else
          @material_quantidade = MaterialQuantidade.new
          @material_quantidade.errors.add(:material, "precisa ser selecionado.")
          format.html { render :new }
          format.json { render json: @material_quantidade.errors, status: :unprocessable_entity }
        end
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
