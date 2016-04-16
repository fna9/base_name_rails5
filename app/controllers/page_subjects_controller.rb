class PageSubjectsController < ApplicationController
  before_action :set_page_subject, only: [:show, :edit, :update, :destroy]

  # GET /page_subjects
  # GET /page_subjects.json
  def index
    @page_subjects = PageSubject.all
  end

  # GET /page_subjects/1
  # GET /page_subjects/1.json
  def show
  end

  # GET /page_subjects/new
  def new
    @page_subject = PageSubject.new
  end

  # GET /page_subjects/1/edit
  def edit
  end

  # POST /page_subjects
  # POST /page_subjects.json
  def create
    @page_subject = PageSubject.new(page_subject_params)

    respond_to do |format|
      if @page_subject.save
        format.html { redirect_to @page_subject, notice: 'Page subject was successfully created.' }
        format.json { render :show, status: :created, location: @page_subject }
      else
        format.html { render :new }
        format.json { render json: @page_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_subjects/1
  # PATCH/PUT /page_subjects/1.json
  def update
    respond_to do |format|
      if @page_subject.update(page_subject_params)
        format.html { redirect_to @page_subject, notice: 'Page subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_subject }
      else
        format.html { render :edit }
        format.json { render json: @page_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_subjects/1
  # DELETE /page_subjects/1.json
  def destroy
    @page_subject.destroy
    respond_to do |format|
      format.html { redirect_to page_subjects_url, notice: 'Page subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_subject
      @page_subject = PageSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_subject_params
      params.require(:page_subject).permit(:page_id, :subject_id)
    end
end
