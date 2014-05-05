module BusinessHelper
  def business_address(business)
    ((business.street =~ /^\s*$/) ? '' : (business.street + ', ')) +
        ((business.city =~ /^\s*$/) ? '' : (business.city + ', ')) +
        business.state + ' ' +
        business.zip
  end
end