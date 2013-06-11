class AddEvidenciaToQuejas < ActiveRecord::Migration
 
  def self.up 
  	add_attachment :descargos, :evidencia
  end

  def self.down
  	remove_attachment :descargos, :evidencia
  end
end