module DisplayHelper
  def category_helper(category)
    link_id = category.title + '_' + category.id.to_s
    content_tag(:li,
                category.title.html_safe +
                    " ".html_safe +
                    new_category_link(category) +
                    new_business_link(category) +
                    display_businesses(category).html_safe +
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

  def new_category_link(category)
    link_to(t('.addcategory',
              default: t("helpers.links.addcategory")),
            new_category_category_path(category.id).html_safe,
            class: 'btn btn-mini').html_safe
  end

  def new_business_link(category)
    link_to(t('.addbusiness',
              default: t("helpers.links.addbusiness")),
            new_category_business_path(category.id).html_safe,
            class: 'btn btn-mini').html_safe
  end

  def display_businesses(category)
    business = category.businesses
    if business.count == 0
      return ''
    else
      business_table(business)
    end
  end

  def business_table(business)
    content_tag(:table,
                content_tag(:thead,
                            business_headers
                ) + content_tag(:tbody, business_table_lines(business))
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
