class PagePagesController < ApplicationController
  before_action :set_page_page, only: [:show, :edit, :update, :destroy]

  # GET /page_pages
  # GET /page_pages.json
  def index
    @page_pages = PagePage.all
  end

  # GET /page_pages/1
  # GET /page_pages/1.json
  def show
  end

  # GET /page_pages/new
  def new
    @page_page = PagePage.new
  end

  # GET /page_pages/1/edit
  def edit
  end

  # POST /page_pages
  # POST /page_pages.json
  def create
    @page_page = PagePage.new(page_page_params)

    respond_to do |format|
      if @page_page.save
        format.html { redirect_to @page_page, notice: 'Page page was successfully created.' }
        format.json { render :show, status: :created, location: @page_page }
      else
        format.html { render :new }
        format.json { render json: @page_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_pages/1
  # PATCH/PUT /page_pages/1.json
  def update
    respond_to do |format|
      if @page_page.update(page_page_params)
        format.html { redirect_to @page_page, notice: 'Page page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_page }
      else
        format.html { render :edit }
        format.json { render json: @page_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_pages/1
  # DELETE /page_pages/1.json
  def destroy
    @page_page.destroy
    respond_to do |format|
      format.html { redirect_to page_pages_url, notice: 'Page page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_page
      @page_page = PagePage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_page_params
      params.require(:page_page).permit(:page_id, :page_id)
    end
end
