class Spree::Admin::MenusController < Spree::Admin::BaseController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Spree::Compose::Menu.all
  end

  def show
    @menus = Spree::Compose::Menu.all
    @pages = Spree::Compose::Content.where(content_type: "Page")
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def new
    @menu = Spree::Compose::Menu.new
  end

  def edit
  end

  def create
    @menu = Spree::Compose::Menu.new(resource_params)

    if @menu.save
      redirect_to admin_menu_path(@menu), notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  def update
    if @menu.update(resource_params)
      redirect_to admin_menu_path(@menu), notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to admin_menus_url, notice: 'Menu was successfully destroyed.'
  end

  private

  def set_resource
    @menu = Spree::Compose::Menu.find(params[:id])
  end

  def resource_params
    params.require(:menu).permit(:name)
  end
  
end