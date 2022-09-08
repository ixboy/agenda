require 'rest-client'
require 'json'

class CepApi

    def initialize(cep_num="91040000")
      @cep_num = cep_num
      @url = "http://viacep.com.br/ws/#{cep_num}/json"
      @headers = {
        'content-type': "application/json",
        'cache-control': "no-cache"
      }
    end    

    def call
        res = RestClient.get(@url)
        body = JSON.parse(res, { symbolize_names: true })
        body
    end
end