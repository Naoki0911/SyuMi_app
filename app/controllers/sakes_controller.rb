class SakesController < ApplicationController
  before_action :set_sake, only: [:show, :edit, :update, :destroy]

  # GET /sakes
  def index
    @sakes = Sake.all
  end

  # GET /sakes/1
  def show
  end

  # GET /sakes/new
  def new
    @sake = Sake.new
  end

  # GET /sakes/1/edit
  def edit
  end

  # POST /sakes
  def create
    @sake = Sake.new(sake_params)

    if @sake.save
      redirect_to @sake, notice: 'Sake was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sakes/1
  def update
    if @sake.update(sake_params)
      redirect_to @sake, notice: 'Sake was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sakes/1
  def destroy
    @sake.destroy
    redirect_to sakes_url, notice: 'Sake was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sake
      @sake = Sake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sake_params
      params.require(:sake).permit(:name, :content, :place, :sweetness, :flavor, :sour, :feeling, :rich, :user_id)
    end
end
