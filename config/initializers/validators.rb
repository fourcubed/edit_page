class UriValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^\w*$/
      object.errors[attribute] << (options[:message] || "is not formatted properly")
    end
  end
end