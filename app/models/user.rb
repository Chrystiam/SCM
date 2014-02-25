class User < ActiveRecord::Base
  #rolify
  authenticates_with_sorcery!
  has_many :user_roles
  has_many :roles, :through => :user_roles
 
  
  #atributos
  attr_accessible :role_ids,:username, :email, :password, :password_confirmation, :nombre,  :roles
  
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

  def self.indexar(userid)
    @quejauser = User.where(:id => userid)
  end
  
end
