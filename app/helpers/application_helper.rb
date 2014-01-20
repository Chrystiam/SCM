module ApplicationHelper

	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end    
    #metodo que retorna el nombre del rol, para el user logueado y se ejecuta en la vista
    def has_role
		@userid = UserRole.find(current_user.id)
	    @userolname = Role.find(@userid.role_id)
	    @rolename = @userolname.name
	    return @rolename.downcase 
    end
end
