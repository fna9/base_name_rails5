class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  def search
    @pages = Page.where('contents ilike ?', "%#{params['contents']}%").all
    render(:index)
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
    @page.community_pages.build(community_id: params[:community_id], ismain: params[:ismain])
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        s = Subject.where(id: params[:subject_id]).first
        ps = PageSubject.create(page: @page, subject: s) if s.present?
        format.html { 
          if (@community = @page.community_pages.first).present?
            redirect_to @community.community, notice: 'Страница успешно создана' 
          else
            redirect_to @page, notice: 'Страница успешно создана' 
          end
        }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { 
          if (@community = @page.community_pages.first).present?
            redirect_to @community.community, notice: 'Страница успешно изменена' 
          else
            redirect_to @page, notice: 'Страница успешно изменена' 
          end
        }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Страница успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:visibility, :header, :contents, :alias, community_pages_attributes: [:page_id, :community_id, :ismain, :id, :_destroy])
    end
end
