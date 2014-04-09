module DisplayHelper
  def category_helper(category)
    link_id = category.title + '_' + category.id.to_s
    content_tag(:li,
                category.title.html_safe + " ".html_safe +
                    link_to(t('.addcategory',
                              default: t("helpers.links.addcategory")),
                            new_category_category_path(category.id).html_safe,
                            class: 'btn btn-mini').html_safe +
                                subcategories(category.categories),
                id: link_id
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
