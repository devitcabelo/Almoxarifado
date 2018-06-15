class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]

  def index
    @registros = Registro.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_registro
    @registro = Registro.find(params[:id])
  end
end