class SubjectsController < ApplicationController
  # tells controller to render templates using 'admin.html.erb' layout
  layout 'admin'

  before_action :get_subject_count, only: [:new, :create, :edit, :update]

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    # we're not saving a subject here, but passing along a new subject gives the
    # form access to any database defaults set for this model
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)
    else
      # show form again with user values if database save fails
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully."
      redirect_to(subjects_path(subject))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "Subject deleted successfully."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    # whitelist params for mass-assignment
    params.require(:subject).permit(:name, :position, :visible)
  end

  def get_subject_count
    @subject_count = Subject.count
    @subject_count += 1 if params[:action] == 'new' || params[:action] == 'create'
  end
end
