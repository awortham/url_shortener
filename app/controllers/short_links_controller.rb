class ShortLinksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    respond_to :json
    short_link = ShortLink.find_or_initialize_by(original_url: short_link_params[:long_url])

    if short_link.save
      body = { long_url: short_link.original_url, short_link: short_link_url(short_link.short_url) }

      render json: body
    else
      render json: short_link.errors
    end
  end

  def show
    long_url = ShortLink.find_by(short_url: short_link_params[:short_url]).try(:original_url)

    if long_url
      redirect_to long_url, status: 301
    else
      render json: { error: 'This url does not yet exist. Please create it and then try again.' }
    end
  end

  private

  def short_link_params
    params.permit(:long_url, :short_url)
  end
end
