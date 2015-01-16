class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show, :edit, :update, :destroy]
  helper_method :current_host

  # GET /short_urls
  # GET /short_urls.json
  def index
    @short_urls = ShortUrl.all
  end

  # GET /short_urls/1
  # GET /short_urls/1.json
  def show
  end

  # GET /short_urls/new
  def new
    @short_url = ShortUrl.new
  end

  # GET /short_urls/1/edit
  def edit
  end

  # POST /short_urls
  # POST /short_urls.json
  def create
    @short_url = ShortUrl.new(short_url_params)

    respond_to do |format|
      if @short_url.save
        format.html { redirect_to @short_url, notice: 'Short url was successfully created.' }
        format.json { render :show, status: :created, location: @short_url }
      else
        format.html { render :new }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_urls/1
  # PATCH/PUT /short_urls/1.json
  def update
    respond_to do |format|
      if @short_url.update(short_url_params)
        format.html { redirect_to @short_url, notice: 'Short url was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_url }
      else
        format.html { render :edit }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_urls/1
  # DELETE /short_urls/1.json
  def destroy
    @short_url.destroy
    respond_to do |format|
      format.html { redirect_to short_urls_url, notice: 'Short url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def redirect_me
    if short_url = ShortUrl.find_by_short(params[:short])
      full_url = short_url.full
      redirect_to full_url
    else
      render status: 404
    end
  end

  def current_host
    "http://#{request.host}:#{request.port}/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_url
      @short_url = ShortUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_url_params
      params.require(:short_url).permit(:full)
    end

end
