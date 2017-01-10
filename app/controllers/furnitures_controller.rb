class FurnituresController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]

  def index
    @furnitures = Furniture.all
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

  # post
  def purchase
    puts 'inside purchase method'
    #Adding furnipts to owner
    furni_id = params[:furniId]
    the_furni = Furniture.find(params[:furniId])
    the_user = User.find(the_furni.user_id)
    furnipts = the_user.furnipoints
    new_furnipts = furnipts + the_furni.furnipoints
    the_user.update(furnipoints: new_furnipts)

    #Subtracting furnipts from buyer
    puts 'current user id is '
    puts session[:user_id]
    curr_user = User.find(session[:user_id])
    curr_furnipts = curr_user.furnipoints
    curr_new_furnipts = curr_furnipts - the_furni.furnipoints
    puts 'curr_new_furni'
    puts curr_new_furnipts
    curr_user.update(furnipoints: curr_new_furnipts)
    # puts @current_user
    redirect_to '/furnitures'
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
