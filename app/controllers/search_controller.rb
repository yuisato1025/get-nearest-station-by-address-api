require 'net/http'
require 'uri'

class SearchController < ApplicationController
    GEOCORDER_API_BASE_URL = 'https://msearch.gsi.go.jp/address-search/AddressSearch?'
    EXPRESS_API_BASE_URL = 'http://express.heartrails.com/api/json?'

    def getNearestStation
        address = params[:address]
        lng, lat = getCoordinateFromAddress(address)
        station = getStationFromCoordinate(lng, lat)

        render json: { status: 'SUCCESS', data: { station: station } }
    end

    # 住所から経度緯度を取得する
    def getCoordinateFromAddress(address)
        encodedQuery = URI.encode_www_form(q: address)
        geocorderUrl = GEOCORDER_API_BASE_URL + encodedQuery
        uri = URI.parse(geocorderUrl)

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        http.use_ssl = true
        response = http.request(request)    
        return JSON.parse(response.body)[0]["geometry"]["coordinates"]
    end

    # 経度緯度から最寄り駅を取得する
    def getStationFromCoordinate(lng, lat)
        encodedQuery = URI.encode_www_form(method: "getStations", x: lng, y: lat)
        expressUrl = EXPRESS_API_BASE_URL + encodedQuery
        uri = URI.parse(expressUrl)

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri, {'Content-Type' => 'application/json'})
        response = http.request(request)
    
        return JSON.parse(response.body)["response"]["station"][0]["name"]
    end
end
