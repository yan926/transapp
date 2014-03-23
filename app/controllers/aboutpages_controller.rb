class AboutpagesController < ApplicationController
  before_action :signed_in_user,  only: [:new, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :edit, :update, :destroy]

  def index
    # @aboutpages = Aboutpage.order("created_at DESC")
    # @aboutpages = Aboutpage.paginate(page: params[:page] , :per_page => 5).order('created_at DESC')
    @aboutpages = Aboutpage.where(:language => I18n.locale.to_s)
  end
 
  def show
    @aboutpage = Aboutpage.find(params[:id])
  end
 
  def new
    @aboutpage = Aboutpage.new
  end
 
  def create
    @aboutpage = Aboutpage.new(aboutpage_params)
    if @aboutpage.save
      redirect_to aboutpages_path, notice: "The aboutpage has been successfully created."
    else
      render action: "new"
    end
  end
 
  def edit
    @aboutpage = Aboutpage.find(params[:id])
  end
 
  def update
    @aboutpage = Aboutpage.find(params[:id])
    if @aboutpage.update_attributes(aboutpage_params)
      redirect_to aboutpages_path, notice: "The aboutpage has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    Aboutpage.find(params[:id]).destroy
    flash[:success] = "Aboutpage destroyed."
    redirect_to aboutpages_url
  end
 
private
 
  def aboutpage_params
    params.require(:aboutpage).permit(:language, :body)
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
