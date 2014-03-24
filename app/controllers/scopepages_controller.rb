class ScopepagesController < ApplicationController
  before_action :signed_in_user,  only: [:new, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :edit, :update, :destroy]

  def index
    # @scopepages = Scopepage.order("created_at DESC")
    # @scopepages = Scopepage.paginate(page: params[:page] , :per_page => 5).order('created_at DESC')
    @scopepages = Scopepage.where(:language => I18n.locale.to_s)
  end
 
  def show
    @scopepage = Scopepage.find(params[:id])
  end
 
  def new
    @scopepage = Scopepage.new
  end
 
  def create
    @scopepage = Scopepage.new(scopepage_params)
    if @scopepage.save
      redirect_to scopepages_path, notice: "The scopepage has been successfully created."
    else
      render action: "new"
    end
  end
 
  def edit
    @scopepage = Scopepage.find(params[:id])
  end
 
  def update
    @scopepage = Scopepage.find(params[:id])
    if @scopepage.update_attributes(scopepage_params)
      redirect_to scopepages_path, notice: "The scopepage has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    Scopepage.find(params[:id]).destroy
    flash[:success] = "Scopepage destroyed."
    redirect_to scopepages_url
  end
 
private
 
  def scopepage_params
    params.require(:scopepage).permit(:language, :body)
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
