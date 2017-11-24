class Spree::UserSessionsController < Devise::SessionsController
  before_action :load_taxonomies

  def load_taxonomies
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end
