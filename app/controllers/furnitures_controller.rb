class FurnituresController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]

  def index
    @furnitures = Furniture.all
    puts 'current user is'
    puts session[:user_id]
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_furni = @current_user.furnitures
    end
  end

  def show
    @furni = Furniture.find(params[:id])
    @comments = @furni.comments
  end

  def new
    @furniture = Furniture.new
  end

  def edit
  end

  # get
  def by_category
    @furniturez = Furniture.where(name: params[:type])
    render "category"
  end

  def trade
    # puts 'inside trade method'
    # puts 'the user is '
    # puts session[:user_id]
    current_user = User.find(session[:user_id])
    wanted_furni = Furniture.find(params[:furniId2])
    my_chosen_furni = Furniture.find(params[:furnichosen])
    user_of_furni = User.find(wanted_furni.user_id)
    
    #switching furni in current user
    wanted_furni.update(user_id: current_user.id)
    my_chosen_furni.update(user_id: user_of_furni.id)

    redirect_to '/furnitures'
  end

  # post
  def purchase
    #1-Adding furnipts to owner
    furni_id = params[:furniId]
    the_furni = Furniture.find(params[:furniId])
    the_user = User.find(the_furni.user_id)
    furnipts = the_user.furnipoints
    new_furnipts = furnipts + the_furni.furnipoints
    the_user.update(furnipoints: new_furnipts)

    #2-Subtracting furnipts from buyer
    curr_user = User.find(session[:user_id])
    curr_furnipts = curr_user.furnipoints
    curr_new_furnipts = curr_furnipts - the_furni.furnipoints
    curr_user.update(furnipoints: curr_new_furnipts)

    #3-transferring furni from owner to buyer
    the_furni.update(user_id: curr_user.id)

    redirect_to '/furnitures'
  end

  #post
  def wishlist
    puts 'inside wishlist method'
    puts params[:furniture_id]
    if session[:user_id]
      @favorite_furni = Furniture.find(params[:furniture_id])
      @favorite_furni.update(favoriter_id: current_user.id)
      redirect_to '/home/wishlist'
    else 
      redirect_to '/home/error'
    end
  end

  def create
    @furniture = Furniture.new(furniture_params)

    respond_to do |format|
      if @furniture.save
        puts 'furnitcha was saved'
        format.html { redirect_to @furniture, notice: 'Furniture was successfully created.' }
        format.json { render :show, status: :created, location: @furniture }
      else
        format.html { render :new }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @furniture.update(furniture_params)
        format.html { redirect_to @furniture, notice: 'Furniture was successfully updated.' }
        format.json { render :show, status: :ok, location: @furniture }
      else
        format.html { render :edit }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @furniture.destroy
    respond_to do |format|
      format.html { redirect_to furnitures_url, notice: 'Furniture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture
      @furniture = Furniture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_params
      params.require(:furniture).permit(:name, :content, :image_url, :dimensions, :condition, :furnipoints).merge(user_id:session[:user_id])
    end
end
