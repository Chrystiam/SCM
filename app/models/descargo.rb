class Descargo < ActiveRecord::Base
	
    attr_accessible :descripcion, :evidencia

    def self.search(search)
		where('descripcion like ?', "%#{search}%",)
	end

	has_attached_file :evidencia, :styles => { :small => "150x150>", :lsmall => "30x30>" }


	validates_attachment_presence :evidencia
	validates_attachment_size :evidencia, :less_than => 5.megabytes
	validates_attachment_content_type :evidencia, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif', 'image/g3fax', 'image/IEF', 'image/tiff', 'text/plain', 'audio/32kadpcm', 'audio/basic', 'video/mpeg', 'application/pdf', 'application/x-pdf']
end

