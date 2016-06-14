class ArticlesController < ApplicationController
  include ArticlesHelper

  before_filter :require_login, except: [:index, :show, :show_by_month]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def show_by_month
    @articles = Article.all
    @articles_by_month = {
      :January => [],
      :February => [],
      :March => [],
      :April => [],
      :May => [],
      :June => [],
      :July => [],
      :August => [],
      :September => [],
      :October => [],
      :November => [],
      :December => []
    }
    @articles.each do |article|
      month = article.created_at.strftime("%B")
      @articles_by_month[month.to_sym] << article
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' created!"

    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' deleted!"

    redirect_to articles_path
  end

end
