class UrlsController < ApplicationController
  def index
  end

  def create
    url = Url.new
    url.url = params[:url_to_shorten]
    url.save
    url.short_url = url.id
    url.save
    redirect_to "/#{url.id}?stats=true"
  end

  def status
    @url = Url.find(params[:id])
    if !params[:stats]
      redirect_to @url = Url.find(params[:id]).url
    end
  end
end
