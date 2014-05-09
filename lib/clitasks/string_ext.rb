require 'pp'

class String
  def underscore
    gsub(/(\W|_)+/, ?_)
  end

  def strip_chr(chrs)
    gsub(%r{(^[#{chrs}]*|[#{chrs}]*$)}, '')
  end

  def sanitize
    gsub(/\W+/, ' ')
  end

  def pathify
    downcase.underscore.strip_chr(?_)
  end
end
