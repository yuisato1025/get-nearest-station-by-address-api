class SearchController < ApplicationController

    def getNearestStation
        render json: { status: 'SUCCESS', data: { station: "exampleStation" } }
    end
end
