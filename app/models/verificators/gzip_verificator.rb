require 'verificator'
class GzipVerificator < Verificator
  def perform(uri)
    errors = []
    get_css.each do |css, res|
      #TODO replace hard coded errors with keys and puts error messages in locale files instead
      errors << css.to_s + " <span class=\"error\">is not gzipped</span>" unless res['Content-Encoding'] || res['Content-Encoding'] == 'gzip'
    end
    errors
  end
  
end