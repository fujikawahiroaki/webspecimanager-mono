class CollectionSettingsController < ApplicationController
  before_action :set_collection_setting, only: %i[ show edit update destroy ]
  before_action :require_login

  # GET /collection_settings or /collection_settings.json
  def index
    @collection_settings = CollectionSetting.all
  end

  # GET /collection_settings/1 or /collection_settings/1.json
  def show
  end

  # GET /collection_settings/new
  def new
    @collection_setting = CollectionSetting.new
  end

  # GET /collection_settings/1/edit
  def edit
  end

  # POST /collection_settings or /collection_settings.json
  def create
    @collection_setting = CollectionSetting.new(collection_setting_params)

    respond_to do |format|
      if @collection_setting.save
        format.html { redirect_to [ @collection_setting ], notice: "Collection setting was successfully created." }
        format.json { render :show, status: :created, location: @collection_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_settings/1 or /collection_settings/1.json
  def update
    respond_to do |format|
      if @collection_setting.update(collection_setting_params)
        format.html { redirect_to [ @collection_setting ], notice: "Collection setting was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @collection_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_settings/1 or /collection_settings/1.json
  def destroy
    @collection_setting.destroy!

    respond_to do |format|
      format.html { redirect_to _collection_settings_path, notice: "Collection setting was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_setting
      @collection_setting = CollectionSetting.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def collection_setting_params
      params.fetch(:collection_setting, {})
    end
end
