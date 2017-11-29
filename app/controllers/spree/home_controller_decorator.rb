Spree::HomeController.class_eval do
  helper 'spree/products'
  helper 'spree/taxons'
  respond_to :html

  def about
    #@searcher = build_searcher(params.merge(include_images: true))
    #@products = @searcher.retrieve_products
    #@taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    @current_taxon = @taxonomies.last.root
  end
end
