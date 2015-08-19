class Spree::Compose::ContentsController < Spree::StoreController

  # Don't serve local files or static assets
  before_action { render_404 if params[:path] =~ /(\.|\\)/ }
  
  respond_to :html

  def show
    path = "/#{params[:path]}"
    @content = Spree::Compose::Content.visible.find_by_slug(path)
    if @content
      render :show
    else
      render_404
    end
  end
  
end