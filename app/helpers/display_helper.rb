module DisplayHelper
  def category_helper(category)
    content_tag(:li,
                category.title.html_safe + " ".html_safe +
                    link_to(t('.addcategory',
                              :default => t("helpers.links.addcategory")),
                            new_category_category_path(category.id).html_safe,
                            :class => 'btn btn-mini').html_safe +
                                subcategories(category.categories)
                    # link_to('Add Category',
                    #         new_category_category_path(
                    #             category_id: category.id)).html_safe +
                    #             subcategories(category.categories)
    )
  end

  def subcategories(categories)
    return ''.html_safe unless categories.any?
    content_tag(:ul,
                categories.map { |category|
                                 category_helper(category).html_safe }
                .join('').html_safe
    )
  end
end
