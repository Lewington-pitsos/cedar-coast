module Spree::BaseHelper
    def logo(image_path = Spree::Config[:logo], img_options: {})
      link_to image_tag(image_path, img_options), spree.root_path
    end

    def nav_tree(root_taxon, current_taxon, max_level = 1)
      content_tag :li, class: 'category' do
       link_to(root_taxon.name, seo_url(root_taxon))
      end
    end
end
