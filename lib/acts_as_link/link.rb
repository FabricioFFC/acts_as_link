require 'net/http'
require 'uri'

class Link
  
  def initialize(url)
    @uri = URI.parse(url)
    raise 'Link is not an url' if @uri.class != URI::HTTP
  end  
  
  def is_broken?
    response = Net::HTTP.start(@uri.host, @uri.port) { |http| response = http.head(@uri.path.size > 0 ? @uri.path : "/")}  
    response_code_is_not_valid?(response.code)
  end
  
private 

  def response_code_is_not_valid?(code) 
    if code_is_empty(code) || code_is_an_error_code(code)
      true
    else
      false
    end
  end  
  
  def code_is_empty(code)
    if code.nil?
      true
    else
      code[0..0] == ""
    end 
  end
  
  def code_is_an_error_code(code)
    code[0..0] == "4" || code[0..0] == "5"
  end
    
end
