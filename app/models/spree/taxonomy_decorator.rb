Spree::Taxonomy.class_eval do

  private

  def set_name
    binding.pry
    if root
      root.update_columns(
        description: description,
        updated_at: Time.current
      )
    else
      self.root = Spree::Taxon.create!(taxonomy_id: id, description: description)
    end
  end
end
