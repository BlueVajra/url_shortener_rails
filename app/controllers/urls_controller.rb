class UrlsController < ApplicationController
  def index
  end

  def create
    @url = Url.new
    @url.url = params[:url_to_shorten]
    if @url.save
      redirect_to "/#{@url.id}?stats=true"
    else
      render :index
    end
  end

  def show
    @url = Url.find(params[:id])
    if !params[:stats]
      @url.count += 1
      @url.save
      redirect_to @url.url
    end
  end
end