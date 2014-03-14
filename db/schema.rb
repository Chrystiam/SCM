# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 201307012018430) do

  create_table "actas", :force => true do |t|
    t.string   "fecha"
    t.string   "hora_inicio"
    t.string   "hora_terminacion"
    t.string   "objetivo_de_la_reunion"
    t.text     "desarrollo_reunion"
    t.text     "conclusiones"
    t.integer  "comite_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "actas", ["comite_id"], :name => "index_actas_on_comite_id"

  create_table "asignacioncomites", :force => true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "programa_id"
    t.string   "ficha"
    t.string   "fecha"
    t.integer  "estado_id"
    t.integer  "quejaid"
    t.text     "observaciones"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "asignacioncomites", ["estado_id"], :name => "index_asignacioncomites_on_estado_id"
  add_index "asignacioncomites", ["programa_id"], :name => "index_asignacioncomites_on_programa_id"

  create_table "ayudas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "archivo_file_name"
    t.string   "archivo_content_type"
    t.integer  "archivo_file_size"
    t.datetime "archivo_updated_at"
  end

  create_table "cargos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "centros", :force => true do |t|
    t.string   "nombre"
    t.string   "abreviatura"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comites", :force => true do |t|
    t.string   "hora"
    t.text     "nombreapren"
    t.integer  "programa_id"
    t.string   "ficha"
    t.integer  "fcomite_id"
    t.integer  "asignacioncomite_id"
    t.integer  "quejaid"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "comites", ["fcomite_id"], :name => "index_comites_on_fcomite_id"
  add_index "comites", ["programa_id"], :name => "index_comites_on_programa_id"

  create_table "configuraciones", :force => true do |t|
    t.text     "subdirector"
    t.text     "considerando"
    t.integer  "acta_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "configuraciones", ["acta_id"], :name => "index_configuraciones_on_acta_id"

  create_table "coordinadores", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "centro_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "coordinadores", ["centro_id"], :name => "index_coordinadores_on_centro_id"

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "faltas", :force => true do |t|
    t.string   "falta"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "fcomites", :force => true do |t|
    t.string   "fecha"
    t.string   "lugar"
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "fch_nacimiento"
    t.string   "cargo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "instructores", :force => true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "fch_nacimiento"
    t.string   "modalidad"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "prioridades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "programas", :force => true do |t|
    t.string   "descripcion"
    t.string   "abreviatura"
    t.integer  "coordinador_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "estado"
  end

  add_index "programas", ["coordinador_id"], :name => "index_programas_on_coordinador_id"

  create_table "quejas", :force => true do |t|
    t.string   "fechainforme"
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "tipo_documento_id"
    t.string   "identificacion"
    t.string   "telefono"
    t.string   "email"
    t.integer  "programa_id"
    t.string   "ficha"
    t.text     "descripcion"
    t.integer  "falta_id"
    t.text     "testigos"
    t.text     "nombreinfor"
    t.string   "cargo"
    t.integer  "coordinador_id"
    t.integer  "estado_id"
    t.integer  "userid"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "evidencia_file_name"
    t.string   "evidencia_content_type"
    t.integer  "evidencia_file_size"
    t.datetime "evidencia_updated_at"
  end

  add_index "quejas", ["coordinador_id"], :name => "index_quejas_on_coordinador_id"
  add_index "quejas", ["estado_id"], :name => "index_quejas_on_estado_id"
  add_index "quejas", ["falta_id"], :name => "index_quejas_on_falta_id"
  add_index "quejas", ["programa_id"], :name => "index_quejas_on_programa_id"
  add_index "quejas", ["tipo_documento_id"], :name => "index_quejas_on_tipo_documento_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipos_documentos", :force => true do |t|
    t.string   "sigla"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usercomites", :force => true do |t|
    t.string   "nombre"
    t.text     "emails"
    t.integer  "comite_id"
    t.integer  "cargo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "usercomites", ["cargo_id"], :name => "index_usercomites_on_cargo_id"
  add_index "usercomites", ["comite_id"], :name => "index_usercomites_on_comite_id"

  create_table "users", :force => true do |t|
    t.string   "username",                     :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "nombre"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
