class User < ActiveRecord::Base
  rolify
  authenticates_with_sorcery!
  
  #atributos
  attr_accessible :username, :email, :password, :password_confirmation, :nombre
  
  #validaciones
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :nombre

  #buscador
  def self.search(search)
		where('nombre like ?', "%#{search}%",)
	end
  
end
