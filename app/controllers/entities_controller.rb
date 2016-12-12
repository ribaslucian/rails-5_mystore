class EntitiesController < ApplicationController

  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index

    # filtro do TIPO DE PESSOA
    if params[:is_juridic]
      types = {true: true, false: false, null: nil}
      if types.has_key? params[:is_juridic].to_sym
        person_type_sql = {is_juridic: types[params[:is_juridic].to_sym]}
      end
    end

    entities_scope = Entity.includes(
      :person, :corporate
    ).where(person_type_sql).all

    # Apply the search control filter.
    # Note: `like` method here is not built-in Rails scope. You need to define it by yourself.
    entities_scope = entities_scope.all.where([
      'name LIKE :filter',
      #'name LIKE :filter OR documentation LIKE :filter',
      filter: "%#{params[:filter]}%"
    ]) if params[:filter]

    @entities = smart_listing_create :entities, entities_scope, partial: 'entities/tables/list', default_sort: {name: 'asc'}
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
    # se for requisicao ajax vamos utilizar o layout modal
    sleep 2
    render partial: 'entity', layout: 'modal', formats: [:html] if request.xhr?

    # respond_to do |format|
    #   format.html
    #   format.js { render partial: 'entity', layout: 'modal' }
    # end
  end

  # GET /entities/new
  def new
    @entity = Entity.new

    @entity.build_person
    @entity.build_corporate
  end

  # GET /entities/1/edit
  def edit
    if @entity.is_juridic.nil?
      # para entidades indefinidas, contruímos as duas pessoas para o formulários
      @entity.build_person
      @entity.build_corporate
    elsif @entity.is_juridic == false
      # para entidades fisicas, construímos os atributos juridicos
      @entity.build_corporate
    else @entity.is_juridic
      # para entidades juridicas, construímos os atributos fisicas
      @entity.build_person
    end
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = Entity.new entity_params

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity, notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      defaults = [
        :id, :name, :is_juridic, :_destroy,
        addresses_attributes: [
          :id, :priority, :type, :zipcode, :street, :neighborhood,
          :number, :complement, :city, :state, :country, :_destroy
        ],
        person_attributes: [:id, :rg, :cpf, :_destroy],
        corporate_attributes: [:id, :cnpj, :corporate_name, :registration_municipal, :registration_state, :_destroy],
        emails_attributes: [:id, :priority, :email, :description, :_destroy],
        phones_attributes: [:id, :priority, :phone, :description, :_destroy]
      ]

      # caso fisico deletamos os params juridicos e vice-versa
      if params.require(:entity)[:is_juridic] == 'true'
        params[:entity][:person_attributes] = {id: params[:entity][:person_attributes][:id], _destroy: 1}
      else
        params[:entity][:corporate_attributes] = {id: params[:entity][:corporate_attributes][:id], _destroy: 1}
      end

      params.require(:entity).permit defaults
    end
end
