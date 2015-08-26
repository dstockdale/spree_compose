module Spree
  module Compose
    module ApplicationHelper
      
      def zone_render(identifier = nil)
        assigment = Spree::Compose::Assignment.where(path: [request.path, nil, ''], zone: identifier).joins(:content)
        if assigment.exists?
          raw assigment.first.content.body
        end
      end

    end
  end
end