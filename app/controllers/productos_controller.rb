class ProductosController < ApplicationController
  def new
    @producto = Producto.new
  end
  def index
    @productos = Producto.all
  end
  def create
    @producto = Producto.new(parametros)
    if @producto.save
      redirect_to :action => :show, :id => @producto.id
    else
      render "new"
    end
  end
  def edit
    @producto = Producto.find(params[:id])
  end

  def show
    @producto = Producto.find(params[:id])
  end

  def update
    @producto = Producto.find(params[:id])
    if @producto.update(parametros)
      redirect_to :action => :show, :id => @producto.id
    else
      render 'edit'
    end
  end

  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy
    redirect_to :action => :index
  end

  private
  def parametros
    params.require(:producto).permit(:nombre, :descripcion,:precio, :category_id, :image)
  end
end
