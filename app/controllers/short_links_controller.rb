class ShortLinksController < ApplicationController
  before_action :set_short_link, only: %i(show edit expire)

  def short
    @short_link = ShortLink.find_by(slug: params[:slug])

    if @short_link.active?
      ShortLinkViewCounterJob.perform_later(@short_link)
      redirect_to @short_link.original_url
    else
      render_not_found
    end
  end

  def new
    @short_link = ShortLink.new
  end

  def create
    @short_link = ShortLink.new(short_link_params)

    if @short_link.save
      redirect_to @short_link, notice: 'Short link was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def expire
    if @short_link.expire
      redirect_to edit_short_link_path(@short_link), notice: 'Short link was successfully expired.'
    else
      render :edit
    end
  end

  private

  def set_short_link
    @short_link = ShortLink.find(params[:id])
  end

  def short_link_params
    params.require(:short_link).permit(:original_url)
  end
end
