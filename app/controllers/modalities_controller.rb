class ModalitiesController < ApplicationController
  # GET /modalities
  # GET /modalities.json
  def index
    @modalities = Modality.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @modalities }
    end
  end

  # GET /modalities/1
  # GET /modalities/1.json
  def show
    @modality = Modality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @modality }
    end
  end

  # GET /modalities/new
  # GET /modalities/new.json
  def new
    @modality = Modality.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @modality }
    end
  end

  # GET /modalities/1/edit
  def edit
    @modality = Modality.find(params[:id])
  end

  # POST /modalities
  # POST /modalities.json
  def create
    @modality = Modality.new(params[:modality])

    respond_to do |format|
      if @modality.save
        format.html { redirect_to @modality, notice: 'Modality was successfully created.' }
        format.json { render json: @modality, status: :created, location: @modality }
      else
        format.html { render action: "new" }
        format.json { render json: @modality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /modalities/1
  # PUT /modalities/1.json
  def update
    @modality = Modality.find(params[:id])

    respond_to do |format|
      if @modality.update_attributes(params[:modality])
        format.html { redirect_to @modality, notice: 'Modality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @modality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modalities/1
  # DELETE /modalities/1.json
  def destroy
    @modality = Modality.find(params[:id])
    @modality.destroy

    respond_to do |format|
      format.html { redirect_to modalities_url }
      format.json { head :no_content }
    end
  end
end
