class CommunityPagesController < ApplicationController
  before_action :set_community_page, only: [:show, :edit, :update, :destroy]

  # GET /community_pages
  # GET /community_pages.json
  def index
    @community_pages = CommunityPage.all
  end

  # GET /community_pages/1
  # GET /community_pages/1.json
  def show
  end

  # GET /community_pages/new
  def new
    @community_page = CommunityPage.new
  end

  # GET /community_pages/1/edit
  def edit
  end

  # POST /community_pages
  # POST /community_pages.json
  def create
    @community_page = CommunityPage.new(community_page_params)

    respond_to do |format|
      if @community_page.save
        format.html { redirect_to @community_page, notice: 'Community page was successfully created.' }
        format.json { render :show, status: :created, location: @community_page }
      else
        format.html { render :new }
        format.json { render json: @community_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_pages/1
  # PATCH/PUT /community_pages/1.json
  def update
    respond_to do |format|
      if @community_page.update(community_page_params)
        format.html { redirect_to @community_page, notice: 'Community page was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_page }
      else
        format.html { render :edit }
        format.json { render json: @community_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_pages/1
  # DELETE /community_pages/1.json
  def destroy
    @community_page.destroy
    respond_to do |format|
      format.html { redirect_to community_pages_url, notice: 'Community page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_page
      @community_page = CommunityPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_page_params
      params.require(:community_page).permit(:page_id, :community_id, :ismain)
    end
end
