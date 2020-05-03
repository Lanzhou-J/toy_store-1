class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update, :destroy]
  before_action :set_user_toy, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /toys
  def index
    @toys = Toy.all
  end

  # GET /toys/1
  def show
  end

  # GET /toys/new
  def new
    @toy = Toy.new
  end

  # GET /toys/1/edit
  def edit
  end

  # POST /toys
  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      redirect_to @toy
    else
      render :new
    end
  end

  # PATCH/PUT /toys/1
  def update
    if @toy.update(toy_params)
      redirect_to @toy
    else
      render :edit
    end
  end

  # DELETE /toys/1
  def destroy
    @toy.destroy
    redirect_to toys_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_toy
    @toy = Toy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private 
  def toy_params
    params.require(:toy).permit(:name, :description, :date_posted, :posted_by, :picture)
  end

  def set_user_toy
    if current_user != nil
      id = params[:id]
      @toy = current_user.toys.find_by_id(id)
        if @toy == nil
          flash[:unauthorized] = "Not authorized to perform that action ❌"
          redirect_to toys_path
        end
    else
      redirect_to new_user_session_path
    end
  end
end
