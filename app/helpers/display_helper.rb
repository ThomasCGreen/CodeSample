module DisplayHelper
  def category_helper(category)
    content_tag(:li,
      category.title.html_safe + " ".html_safe +
        link_to('Add Category', new_category_category_path(category_id: category.id)).html_safe +
        subcategories(category.categories)
    )

  end

  def subcategories(categories)
    return ''.html_safe unless categories.any?
    content_tag(:ul,
      categories.map{|category| category_helper(category).html_safe }.join('').html_safe
    )
  end
end

__END__
<li>
  <% category = Category.where(id: id).first %>
      <%= category.title %>
  <%= link_to 'Add Category',
                  new_category_category_path(category_id: category.id) %>
      <% sub_categories = Category.where(category_id: id) %>
  <% if sub_categories.count > 0 %>
      <ul>
      <% sub_categories.each { |sub_category| category_helper(sub_category.id) } %>
      </ul>
      <% end %>
    </li>
      <% end %>