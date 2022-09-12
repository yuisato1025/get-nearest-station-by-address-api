require 'net/http'
require 'uri'

class SearchController < ApplicationController
    GEOCORDER_API_BASE_URL = 'https://msearch.gsi.go.jp/address-search/AddressSearch?'
    EXPRESS_API_BASE_URL = 'http://express.heartrails.com/api/json?'
    METERS_PER_MINUTE = 80

    def getNearestStation
        address = params[:address]
        lng, lat = getCoordinateFromAddress(address)
        station, distance = getStationFromCoordinate(lng, lat)
        minutes = (distance.to_i.fdiv(METERS_PER_MINUTE)).ceil

        render json: { status: 'SUCCESS', data: { station: station, minutes: minutes } }
    end

    # 住所から経度緯度を取得する
    def getCoordinateFromAddress(address)
        encodedQuery = URI.encode_www_form(q: address)
        geocorderUrl = GEOCORDER_API_BASE_URL + encodedQuery
        uri = URI.parse(geocorderUrl)
        response = getRequest(uri, true)
        return JSON.parse(response.body)[0]["geometry"]["coordinates"]
    end

    # 経度緯度から最寄り駅を取得する
    def getStationFromCoordinate(lng, lat)
        encodedQuery = URI.encode_www_form(method: "getStations", x: lng, y: lat)
        expressUrl = EXPRESS_API_BASE_URL + encodedQuery
        uri = URI.parse(expressUrl)
        response = JSON.parse(getRequest(uri).body)["response"]["station"][0]
        return response["name"], response["distance"]
    end

    def getRequest(uri, isHttps = false)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if isHttps

        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)  
        return response
    end
end
