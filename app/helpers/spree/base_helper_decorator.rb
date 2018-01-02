module Spree::BaseHelper
    def logo(image_path = Spree::Config[:logo], img_options: {})
      link_to image_tag(image_path, img_options), spree.root_path
    end

    def nav_tree(root_taxon, current_taxon, max_level = 1)
      content_tag :li, class: 'category' do
       link_to(root_taxon.name, seo_url(root_taxon))
      end
    end

    def taxon_breadcrumbs(taxon, separator = '&nbsp;&raquo;&nbsp;', breadcrumb_class = 'inline')
      return '' if current_page?('/') || taxon.nil?

      crumbs = [[t('spree.home'), spree.root_path]]

      if taxon
        crumbs += taxon.ancestors.collect { |a| [a.name, spree.nested_taxons_path(a.permalink)] } unless taxon.ancestors.empty?
        crumbs << [taxon.name, spree.nested_taxons_path(taxon.permalink)]
      end

      crumbs << product_name if product_name

      crumbs = kill_bad_crumbs(crumbs, ['Shop', 'Extras'])

      separator = raw(separator)

      items = crumbs.each_with_index.collect do |crumb, i|
        content_tag(:li, itemprop: 'itemListElement', itemscope: '', itemtype: 'https://schema.org/ListItem') do
          link_to(crumb.last, itemprop: 'item') do
            content_tag(:span, crumb.first, itemprop: 'name') + tag('meta', { itemprop: 'position', content: (i + 1).to_s }, false, false)
          end + (crumb == crumbs.last ? '' : separator)
        end
      end

      content_tag(:nav, content_tag(:ol, raw(items.map(&:mb_chars).join), class: breadcrumb_class, itemscope: '', itemtype: 'https://schema.org/BreadcrumbList'), id: 'breadcrumbs', class: 'sixteen columns')
    end


    def kill_bad_crumbs(array, bad_crumbs)
      array.select do |crumb|
        crumb - bad_crumbs == crumb
      end
    end

    def product_name
      if @body_id == 'product-details'
        [@product.name, "#"]
      else
        false
      end
    end

    def generate_body_id
      # sets the id of the body element to a unique string if @product is truthy
      if @product
        @body_id = 'product-details'
        'product-details'
      else
        'default'
      end
    end
end
