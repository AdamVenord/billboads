class TopicsController < ApplicationController
  before_action :set_artist
  before_action :set_billboard, only: [:show, :edit, :update, :destroy]

  def index
    @billboards = @artist.billboards
  end

  def show
  end

  def new
    @billboard = @artist.billboards.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @billboard = @artist.billboards.new(billboard_params)

    if @billboard.save
      redirect_to [@artist, @billboard]
    else
      render :new
    end
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to [@artist, @billboard]
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to artist_billboards_path(@artist)
  end

  private
    def set_artist
      @artist = artist.find(params[:artist_id])
    end

    def set_topic
      @billboard = Billboard.find(params[:id])
    end

    def billboard_params
      params.require(:billboard).permit(:name, :body)
    end
  end
