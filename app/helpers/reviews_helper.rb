module ReviewsHelper
  def rating_changeable(object, method)
    object_name, method_name = object.to_s.dup.downcase, method.to_s.downcase
    content_tag('div', '', {class: 'rating_changeable',
                            data: {name: "#{object_name}[#{method_name}]"}})
  end

  def rating_readonly(id, value)
    content_tag('div', '', {class: 'rating_readonly',
                            id: "rating_#{id}",
                            data: {rating: "#{value}"}})
  end
end
