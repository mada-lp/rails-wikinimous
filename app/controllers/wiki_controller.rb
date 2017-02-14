class WikiController < ApplicationController
  def index
    @wikis = wiki.all
  end

  def show
    @wiki = wiki.find(params[:id])
  end

  def new
    @wiki = wiki.new
  end

  def create
    @wiki = wiki.new(wiki_params)
    @wiki.save
    redirect_to wikis_path(@wiki)
  end

  def edit
    @wiki = wiki.find(params[:id])
  end

  def update
    @wiki = wiki.find(params[:id])
    @wiki.update(wiki_params)
    redirect_to wikis_path
  end

  def destroy
    @wiki = wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :content)
  end
end
