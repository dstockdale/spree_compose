class Spree::Admin::Compose::ContentsController < Spree::Admin::BaseController
  before_action :set_content, only: [:edit, :update, :destroy]
    
  def index
    @contents = Spree::Compose::Content.all
  end

  def new
    @content = Spree::Compose::Content.new
  end
  
  def edit
  end

  def create
    @content = Spree::Compose::Content.new(permitted_resource_params)
    if @content.save
      redirect_to admin_contents_path, success: "Save new #{@content.content_type}"
    else
      render :new
    end
  end

  def update
    @content.update!(permitted_resource_params)
    redirect_to admin_contents_path, success: "Updated #{@content.content_type}"
  end

  def destroy
    @content.destroy
    redirect_to admin_contents_path, notice: "Removed the #{@content.content_type}"
  end

  private

  def set_content
    @content = Spree::Compose::Content.find(params[:id])
  end

  def permitted_resource_params
    params.require(:content).permit(
      :body, :slug, :subject_id, :content_type, :ancestry, :position, :description, :keywords, :title, :visible,
      translations_attributes: [:id, :locale, :value, :body, :slug, :description, :keywords, :title]
    )
  end
end