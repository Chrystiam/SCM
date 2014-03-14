module ApplicationHelper

	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end    
    #metodo que retorna el nombre del rol, para el user logueado y se ejecuta en la vista
    def has_role
		@userid = UserRole.find_by_user_id(current_user.id)
	    @userolname = Role.find(@userid.role_id)
	    @rolename = @userolname.name
	    return @rolename.downcase 
    end

    def link_to_remove_fields(name, f)
	    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
	   
	end

	def link_to_add_fields(name, f, association)
	  new_object = f.object.class.reflect_on_association(association).klass.new
        fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
           render(association.to_s.singularize + "_fields", :f => builder)
        end
	  link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
	  
	end


	def qpdf(comite)
	    @comite = Comite.find(comite)
	    @idquejas = @comite.idsqueja.split(", ")
		
		return  @idquejas
	end

end
