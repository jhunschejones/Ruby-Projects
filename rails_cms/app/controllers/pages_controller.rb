class PagesController < ApplicationController
  # tells controller to render templates using 'admin.html.erb' layout
  layout 'admin'

  before_action :authenticate_user
  before_action :find_subject
  before_action :find_subjects, only: [:new, :create, :edit, :update]
  before_action :get_page_count, only: [:new, :create, :edit, :update]

  def index
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(subject_id: @subject.id)
  end

  def create
    page = Page.new(page_params)

    if page.save
      flash[:notice] = "Page created successfully."
      redirect_to(pages_path(subject_id: @subject.id))
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
      redirect_to(page_path(page, subject_id: @subject.id))
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
    redirect_to(pages_path(subject_id: @subject.id))
  end

  private

  def page_params
    # whitelist params for mass-assignment
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def get_page_count
    @page_count = @subject.pages.count
    @page_count += 1 if params[:action] == 'new' || params[:action] == 'create'
  end
end
