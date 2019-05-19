class SectionsController < ApplicationController
  # tells controller to render templates using 'admin.html.erb' layout
  layout 'admin'

  before_action :authenticate_user
  before_action :find_page
  before_action :get_section_count, only: [:new, :create, :edit, :update]

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @pages = Page.sorted
  end

  def create
    section = Section.new(section_params)

    if section.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(page_id: @page.id))
    else
      @pages = Page.sorted
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.sorted
  end

  def update
    section = Section.find(params[:id])

    if section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(section_path(section, page_id: @page.id))
    else
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy
    flash[:notice] = "Section deleted successfully."
    redirect_to(sections_path(page_id: @page.id))
  end

  private

  def section_params
    # whitelist params for mass-assignment
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def get_section_count
    @section_count = @page.sections.count
    @section_count += 1 if params[:action] == 'new' || params[:action] == 'create'
  end
end
