class EventpagesController < ApplicationController
  before_action :signed_in_user,  only: [:new, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :edit, :update, :destroy]

  def index
    # @eventpages = Eventpage.order("created_at DESC")
    # @eventpages = Eventpage.paginate(page: params[:page] , :per_page => 5).order('created_at DESC')
    @eventpages = Eventpage.where(:language => I18n.locale.to_s)
  end
 
  def show
    @eventpage = Eventpage.find(params[:id])
  end
 
  def new
    @eventpage = Eventpage.new
  end
 
  def create
    @eventpage = Eventpage.new(eventpage_params)
    if @eventpage.save
      redirect_to eventpages_path, notice: "The eventpage has been successfully created."
    else
      render action: "new"
    end
  end
 
  def edit
    @eventpage = Eventpage.find(params[:id])
  end
 
  def update
    @eventpage = Eventpage.find(params[:id])
    if @eventpage.update_attributes(eventpage_params)
      redirect_to eventpages_path, notice: "The eventpage has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    Eventpage.find(params[:id]).destroy
    flash[:success] = "Eventpage destroyed."
    redirect_to eventpages_url
  end
 
private
 
  def eventpage_params
    params.require(:eventpage).permit(:language, :body)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin? 
  end

end

