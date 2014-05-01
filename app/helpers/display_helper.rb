module DisplayHelper
  def category_helper(category)
    link_id = category.title + '_' + category.id.to_s
    content_tag(:li,
                category_title_with_optional_link(category) +
                    show_businesses_link(category) +
                    new_category_link(category) + ' ' +
                    new_business_link(category) +
                    subcategories(category.categories.order(title: :asc)),
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

  def category_title_with_optional_link(category)
    if category.businesses.count > 0
      (link_to(category.title,
               show_businesses_path(category.id).html_safe,
               class: 'display-link'
      ) + ' ').html_safe
    else
      (category.title + ' ').html_safe
    end
  end

  def show_businesses_link(category)
    return ''.html_safe unless category.businesses.count > 0
    link_to(t('.showbusinesses',
              default: t("helpers.links.showbusinesses")),
            show_businesses_path(category.id).html_safe,
            class: 'ui-button-text button_text').html_safe +
        ' '.html_safe
  end

  def new_category_link(category)
    link_to(t('.addcategory',
              default: t("helpers.links.addcategory")),
            new_category_category_path(category.id).html_safe,
            class: 'ui-button-text button_text').html_safe
  end

  def new_business_link(category)
    return ''.html_safe unless category.businesses.count == 0
    link_to(t('.addbusiness',
              default: t("helpers.links.addbusiness")),
            new_category_business_path(category.id).html_safe,
            class: 'ui-button-text button_text').html_safe
  end

  def display_businesses(category)
    businesses = category.businesses
    category.businesses.any? ? business_table(businesses) : ''
  end

  def business_table(businesses)
    content_tag(:table,
                content_tag(:thead,
                            business_headers
                ) + content_tag(:tbody, business_table_lines(businesses))
    )
  end

  def business_headers
    content_tag(:tr,
                content_tag(:th, 'Name') +
                    content_tag(:th, 'Contact') +
                    content_tag(:th, 'Product') +
                    content_tag(:th, 'Phone') +
                    content_tag(:th, 'Website') +
                    content_tag(:th, 'email') +
                    content_tag(:th, 'Street') +
                    content_tag(:th, 'State') +
                    content_tag(:th, 'Zip')
    )
  end

  def business_table_lines(business)
    result = ''
    business.each do |business|
      result += content_tag(:tr,
                  content_tag(:td, business[:name]) +
                      content_tag(:td, business[:contact]) +
                      content_tag(:td, business[:product]) +
                      content_tag(:td, business[:phone]) +
                      content_tag(:td, business[:website]) +
                      content_tag(:td, business[:email]) +
                      content_tag(:td, business[:street]) +
                      content_tag(:td, business[:city]) +
                      content_tag(:td, business[:state]) +
                      content_tag(:td, business[:zip])
      )
    end
    result.html_safe
  end
end
