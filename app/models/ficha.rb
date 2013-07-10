class Ficha < ActiveRecord::Base
  belongs_to :programa
  has_many :quejas

  attr_accessible :codigo, :programa_id, :estado

  def self.search(search)
		where('codigo like ?', "%#{search}%",)
	end
end
