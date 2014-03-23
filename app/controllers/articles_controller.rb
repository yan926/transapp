class ArticlesController < ApplicationController
  before_action :signed_in_user,  only: [:new, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :edit, :update, :destroy]

  def index
    # @articles = Article.order("created_at DESC")
    @articles = Article.paginate(page: params[:page] , :per_page => 5).order('created_at DESC')
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "The article has been successfully created."
    else
      render action: "new"
    end
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "The article has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "Article destroyed."
    redirect_to articles_url
  end
 
private
 
  def article_params
    params.require(:article).permit(:title, :content)
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
