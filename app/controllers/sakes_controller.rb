class SakesController < ApplicationController
  before_action :set_sake, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]

  # GET /sakes
  def index
    @q = Sake.ransack(params[:q])
    @sake = @q.result(distinct: true)
  end

  # GET /sakes/1
  def show
    @favorite = current_user.favorites.find_by(sake_id: @sake.id)
    @comment = Comment.new
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
    @sake = current_user.sakes.build(sake_params)

    if @sake.save
      redirect_to @sake, notice: '投稿しました'
    else
      render :new
    end
  end

  # PATCH/PUT /sakes/1
  def update
    if @sake.update(sake_params)
      redirect_to @sake, notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  # DELETE /sakes/1
  def destroy
    @sake.destroy
    redirect_to sakes_url, notice: '投稿を削除しました'
  end

  def search
    @q = Sake.search(search_params)
    @sake = @q.result(distinct: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sake
      @sake = Sake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sake_params
      params.require(:sake).permit(:name, :image, :content, :place, :sweetness, :flavor, :sour, :feeling, :rich, label_ids: [] )
    end

    def search_params
      params.require(:q).permit!
    end

    def user_confirmation
      if current_user.id != @sake.user.id
        redirect_to sakes_path
      end
    end
end
