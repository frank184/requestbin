module HashHelper
  def content_for_hash(hash)
    content_tag(:ul, style: 'list-style-type: none;padding:0') do
      hash.each do |k,v|
        concat(content_tag(:li, "#{k}: #{v}"))
      end
    end
  end
end
