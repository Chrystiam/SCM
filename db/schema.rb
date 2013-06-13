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

ActiveRecord::Schema.define(:version => 20130613204057) do

  create_table "actas", :force => true do |t|
    t.string   "ciudad"
    t.date     "fecha"
    t.time     "hora_inicio"
    t.time     "hora_terminacion"
    t.string   "lugar"
    t.string   "tema"
    t.string   "objetivo_de_la_reunion"
    t.text     "desarrollo_reunion"
    t.text     "conclusiones"
    t.string   "firmas"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
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

  create_table "descargos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "faltas", :force => true do |t|
    t.string   "falta"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.string   "telefono"
    t.date     "fch_nacimiento"
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
    t.date     "fch_nacimiento"
    t.string   "modalidad"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "programas", :force => true do |t|
    t.string   "descripcion"
    t.string   "abreviatura"
    t.string   "ficha"
    t.integer  "centro_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "programas", ["centro_id"], :name => "index_programas_on_centro_id"

  create_table "quejas", :force => true do |t|
    t.date     "fechainforme"
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "tipo_documento_id"
    t.string   "identificacion"
    t.integer  "programa_id"
    t.text     "descripcion"
    t.integer  "falta_id"
    t.string   "testigos"
    t.string   "nombresinformante"
    t.string   "apellidosinformante"
    t.string   "direccioninformante"
    t.integer  "cargo_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.text     "descargos"
    t.string   "evidencia_file_name"
    t.string   "evidencia_content_type"
    t.integer  "evidencia_file_size"
    t.datetime "evidencia_updated_at"
    t.string   "telefono"
    t.string   "email"
    t.string   "codigo"
  end

  add_index "quejas", ["cargo_id"], :name => "index_quejas_on_cargo_id"
  add_index "quejas", ["falta_id"], :name => "index_quejas_on_falta_id"
  add_index "quejas", ["programa_id"], :name => "index_quejas_on_programa_id"
  add_index "quejas", ["tipo_documento_id"], :name => "index_quejas_on_tipo_documento_id"

  create_table "tipos_documentos", :force => true do |t|
    t.string   "sigla"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
