class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update, :show, :destroy]
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
  
    if @prototype.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
   
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
      #成功したら詳細ページに行く
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:image, :concept, :catch_copy, :title).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
