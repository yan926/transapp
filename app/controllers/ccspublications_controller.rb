class CcspublicationsController < ApplicationController
  before_action :signed_in_user,  only: [:new, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :edit, :update, :destroy]

  # GET /ccspublications
  # GET /ccspublications.json
  def index
    # @ccspublications = Ccspublication.all
    @ccspublications = Ccspublication.where(:language => I18n.locale.to_s)
  end

  # GET /ccspublications/1
  # GET /ccspublications/1.json
  def show
    @ccspublication = Ccspublication.find(params[:id])
  end

  # GET /ccspublications/new
  def new
    @ccspublication = Ccspublication.new
  end

  # GET /ccspublications/1/edit
  def edit
    @ccspublication = Ccspublication.find(params[:id])
  end

  # POST /ccspublications
  # POST /ccspublications.json
  def create
    @ccspublication = Ccspublication.new(ccspublication_params)
    if @ccspublication.save
      redirect_to ccspublications_path, notice: "The Cross-Cultural Studies Publication has been successfully created."
    else
      render action: "new"
    end
  end

  # PATCH/PUT /ccspublications/1
  # PATCH/PUT /ccspublications/1.json
  def update
    @ccspublication = Ccspublication.find(params[:id])
    if @ccspublication.update_attributes(ccspublication_params)
      redirect_to ccspublications_path, notice: "The Cross-Cultural Studies Publication has been successfully updated."
    else
      render action: "edit"
    end
  end

  # DELETE /ccspublications/1
  # DELETE /ccspublications/1.json
  def destroy
    Ccspublication.find(params[:id]).destroy
    flash[:success] = "ross-Cultural Studies Publication destroyed."
    redirect_to ccspublications_url
  end

private

  def ccspublication_params
    params.require(:ccspublication).permit(:language, :body)
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
