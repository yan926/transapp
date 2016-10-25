class SpecialissuesController < ApplicationController
  before_action :signed_in_user,  only: [:new, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :edit, :update, :destroy]
  # GET /specialissues
  # GET /specialissues.json
  def index
    # @specialissues = Specialissue.all
    @specialissues = Specialissue.where("language = ? ", I18n.locale.to_s).all
    if params[:no]
      @specialissue = Specialissue.where("language = ? AND id = ?", I18n.locale.to_s,params[:no] ).take
    else
      @specialissue = Specialissue.where("language = ?", I18n.locale.to_s).order('created_at').last
    end
  end

  # GET /specialissues/1
  # GET /specialissues/1.json
  def show
  end

  # GET /specialissues/new
  def new
    @specialissue = Specialissue.new
  end

  # GET /specialissues/1/edit
  def edit
    @specialissue = Specialissue.find(params[:id])
  end

  # POST /specialissues
  # POST /specialissues.json
  def create
    @specialissue = Specialissue.new(specialissue_params)

    if @specialissue.save
      redirect_to specialissues_path, notice: 'Specialissue was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /specialissues/1
  # PATCH/PUT /specialissues/1.json
  def update
    if @specialissue.update(specialissue_params)
      redirect_to specialissues_path, notice: 'Specialissue was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /specialissues/1
  # DELETE /specialissues/1.json
  def destroy
    Specialissue.find(params[:id]).destroy
    flash[:success] = "Specialissue Publication destroyed."
    redirect_to specialissues_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def specialissue_params
      params.require(:specialissue).permit(:body, :language, :title)
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
