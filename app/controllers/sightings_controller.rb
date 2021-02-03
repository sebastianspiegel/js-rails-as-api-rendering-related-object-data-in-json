class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(id: params[:id])
        #render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
        #render json: sighting, include: [:bird, :location]
        if sighting
            render json: sighting.to_json(include: [:bird, :location])
        else
            render json: { message: 'No sighting found with that id' }
        end
    end 

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end 
end
