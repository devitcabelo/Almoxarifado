class DefineLabelService
  def self.label_for_material_quantidade params
    labels = {}
    labels[:titulo] = "Cadastrar " + params[:acao].to_s + " de materiais"
    labels[:quantidade] = "Quantidade a ser " + ( params[:acao].eql?("entrada") ? "adicionada" : "retirada" )
    labels
  end
end