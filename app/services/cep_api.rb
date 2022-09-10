require 'rest-client'
require 'json'

class CepApi
  def initialize(cep_num)
    @cep_num = cep_num
    @url = "http://viacep.com.br/ws/#{cep_num}/json"
    @headers = {
      'content-type': 'application/json',
      'cache-control': 'no-cache'
    }
  end

  def call
    res = RestClient.get(@url)
    JSON.parse(res, { symbolize_names: true })
  end
end
