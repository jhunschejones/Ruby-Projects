class PagesController < ApplicationController
  # tells controller to render templates using 'admin.html.erb' layout
  layout 'admin'

  before_action :find_subjects, only: [:new, :create, :edit, :update]
  before_action :get_page_count, only: [:new, :create, :edit, :update]

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    page = Page.new(page_params)

    if page.save
      flash[:notice] = "Page created successfully."
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    page = Page.find(params[:id])

    if page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(page_path(page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    flash[:notice] = "Page deleted successfully."
    redirect_to(pages_path)
  end

  private

  def page_params
    # whitelist params for mass-assignment
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def get_page_count
    @page_count = Page.count
    @page_count += 1 if params[:action] == 'new' || params[:action] == 'create'
  end
end
