class ArticlesController < ApplicationController
  include ArticlesHelper

  before_filter :require_login, except: [:index, :show, :show_by_month]

  def index
    @articles = Article.all.order(view_count: :desc)
    @title = "- home"
  end

  def show
    @article = Article.find(params[:id])
    @title = "- \"#{@article.title}\""
    if @article.author_id.nil?
      @username = "Anonymous"
    else
      @author = Author.find_by_id(@article.author_id)
      @username = @author.username
    end
    @comment = Comment.new
    @comment.article_id = @article.id

    @article.increment_view_count
  end

  def show_by_month
    @articles = Article.all
    @title = "- posts by month"
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
    @title = "- new post"
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    @article.save

    flash.notice = "Post '#{@article.title}' created!"

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
