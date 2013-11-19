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

ActiveRecord::Schema.define(:version => 20130919003340) do

  create_table "actas", :force => true do |t|
    t.string   "ciudad"
    t.string   "fecha"
    t.string   "hora_inicio"
    t.string   "hora_terminacion"
    t.string   "lugar"
    t.string   "tema"
    t.string   "objetivo_de_la_reunion"
    t.text     "desarrollo_reunion"
    t.text     "conclusiones"
    t.string   "firmas"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

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
    t.string   "fecha"
    t.string   "hora"
    t.string   "lugar"
    t.integer  "queja_id"
    t.integer  "falta_id"
    t.integer  "prioridad_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comites", ["falta_id"], :name => "index_comites_on_falta_id"
  add_index "comites", ["prioridad_id"], :name => "index_comites_on_prioridad_id"
  add_index "comites", ["queja_id"], :name => "index_comites_on_queja_id"

  create_table "faltas", :force => true do |t|
    t.string   "falta"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "fichas", :force => true do |t|
    t.string   "codigo"
    t.integer  "programa_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "estado"
  end

  add_index "fichas", ["programa_id"], :name => "index_fichas_on_programa_id"

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
    t.integer  "centro_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "estado"
  end

  add_index "programas", ["centro_id"], :name => "index_programas_on_centro_id"

  create_table "quejas", :force => true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "tipo_documento_id"
    t.string   "identificacion"
    t.string   "telefono"
    t.string   "email"
    t.integer  "programa_id"
    t.text     "descripcion"
    t.integer  "falta_id"
    t.string   "testigos"
    t.string   "nombresinformante"
    t.string   "apellidosinformante"
    t.string   "direccioninformante"
    t.integer  "cargo_id"
    t.text     "descargos"
    t.integer  "ficha_id"
    t.integer  "centro_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "evidencia_file_name"
    t.string   "evidencia_content_type"
    t.integer  "evidencia_file_size"
    t.datetime "evidencia_updated_at"
    t.string   "emailinfor"
    t.boolean  "estado"
  end

  add_index "quejas", ["cargo_id"], :name => "index_quejas_on_cargo_id"
  add_index "quejas", ["centro_id"], :name => "index_quejas_on_centro_id"
  add_index "quejas", ["falta_id"], :name => "index_quejas_on_falta_id"
  add_index "quejas", ["ficha_id"], :name => "index_quejas_on_ficha_id"
  add_index "quejas", ["programa_id"], :name => "index_quejas_on_programa_id"
  add_index "quejas", ["tipo_documento_id"], :name => "index_quejas_on_tipo_documento_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "tipos_documentos", :force => true do |t|
    t.string   "sigla"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "usercomites", :force => true do |t|
    t.string   "nc"
    t.string   "cedula"
    t.string   "email"
    t.string   "fch_ncto"
    t.integer  "cargo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "usercomites", ["cargo_id"], :name => "index_usercomites_on_cargo_id"

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

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
