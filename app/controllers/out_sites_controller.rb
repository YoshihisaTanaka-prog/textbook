class OutSitesController < ApplicationController
  before_action :set_out_site, only: %i[ show edit update destroy ]
  before_action :confirm_teacher, only: %i[ show new edit create update destroy]

  # GET /out_sites or /out_sites.json
  def index
    @out_sites = OutSite.all
  end

  # GET /out_sites/1 or /out_sites/1.json
  def show
  end

  # GET /out_sites/new
  def new
    @out_site = OutSite.new
  end

  # GET /out_sites/1/edit
  def edit
  end

  # POST /out_sites or /out_sites.json
  def create
    @out_site = OutSite.new(out_site_params)

    respond_to do |format|
      if @out_site.save
        format.html { redirect_to out_site_url(@out_site), notice: "Out site was successfully created." }
        format.json { render :show, status: :created, location: @out_site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @out_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /out_sites/1 or /out_sites/1.json
  def update
    respond_to do |format|
      if @out_site.update(out_site_params)
        format.html { redirect_to out_site_url(@out_site), notice: "Out site was successfully updated." }
        format.json { render :show, status: :ok, location: @out_site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @out_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /out_sites/1 or /out_sites/1.json
  def destroy
    @out_site.destroy

    respond_to do |format|
      format.html { redirect_to out_sites_url, notice: "Out site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_out_site
      @out_site = OutSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def out_site_params
      params.require(:out_site).permit(:title, :url)
    end
end
