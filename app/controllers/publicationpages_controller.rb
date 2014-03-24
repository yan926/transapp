class PublicationpagesController < ApplicationController
  before_action :signed_in_user,  only: [:new, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :edit, :update, :destroy]

  def index
    # @publicationpages = Publicationpage.order("created_at DESC")
    # @publicationpages = Publicationpage.paginate(page: params[:page] , :per_page => 5).order('created_at DESC')
    @publicationpages = Publicationpage.where(:language => I18n.locale.to_s)
  end
 
  def show
    @publicationpage = Publicationpage.find(params[:id])
  end
 
  def new
    @publicationpage = Publicationpage.new
  end
 
  def create
    @publicationpage = Publicationpage.new(publicationpage_params)
    if @publicationpage.save
      redirect_to publicationpages_path, notice: "The publicationpage has been successfully created."
    else
      render action: "new"
    end
  end
 
  def edit
    @publicationpage = Publicationpage.find(params[:id])
  end
 
  def update
    @publicationpage = Publicationpage.find(params[:id])
    if @publicationpage.update_attributes(publicationpage_params)
      redirect_to publicationpages_path, notice: "The publicationpage has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    Publicationpage.find(params[:id]).destroy
    flash[:success] = "Publicationpage destroyed."
    redirect_to publicationpages_url
  end
 
private
 
  def publicationpage_params
    params.require(:publicationpage).permit(:language, :body)
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


