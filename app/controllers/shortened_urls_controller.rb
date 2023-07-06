class ShortenedUrlsController < ApplicationController
  def index
    @shortened_url = ShortenedUrl.new
  end

  def create
    @shortened_url = ShortenedUrl.new(url_params)
    if @shortened_url.save
      redirect_to @shortened_url
    else
      redirect_to shortened_urls_path
    end
  end

  def show
    @shortened_url = ShortenedUrl.find_by(id: params[:id])
    redirect_to shortened_urls_path unless @shortened_url
  end

  def original_url
    @shortened_url = ShortenedUrl.find_by(short_url: params[:url])
    redirect_to @shortened_url.original_url
  end

  private

  def url_params
    params.require(:shortened_url).permit(:original_url, :short_url)
  end
end
