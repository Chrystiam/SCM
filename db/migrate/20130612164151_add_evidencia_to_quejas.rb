class AddEvidenciaToQuejas < ActiveRecord::Migration
 
  def self.up 
  	add_attachment :quejas, :evidencia
  end

  def self.down
  	remove_attachment :quejas, :evidencia
  end
  
end
