Spree::Admin::TranslationsController.class_eval do

  def klass
    klass_name = params[:resource] == 'compose_contents' ? 'Compose::Content' : params[:resource].classify
    @klass ||= "Spree::#{klass_name.classify}".constantize
  end

end