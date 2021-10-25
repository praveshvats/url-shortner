class ShortenedUrlsController < ApplicationController

 skip_before_filter :verify_authenticity_token, only: [:create]

  def index
    @links = Link.all
    render :json => {success:true, links: @links}, status: :ok
  end

  def create
    @link = Link.shorten(params[:url])
    if @link
      render :json => {success:true}, status: :ok
    else
      render :json => {success:false, link: @link.errors.full_messages}, status: ok
    end
  end

  def show
    @link = Link.find_by_slug(params[:id])
    render :json => {success:true, message: 'not found' } and return  if @link.nil?
    @link.update_attribute(:clicked, @link.clicked + 1)
    render :json => {success:true, url:  @link.url}, status: :ok
  end

end
