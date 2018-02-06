Spree::HomeController.class_eval do
  helper 'spree/products'
  helper 'spree/taxons'
  respond_to :html

  def about
    
  end

  def cedar_coast
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    @cc_taxon = nil

    if @taxonomies[2]
      @cc_taxon = @taxonomies[2].root
    end
  end

  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    @extras_taxon = nil

    if @taxonomies[1]
      @extras_taxon = @taxonomies[1].root
    end
  end
end
