class ScientistsController < ApplicationController

    def index 
        render json: Scientist.all, status: :ok
    end

    def show 
        render json: find_sci, serializer: ScienWithPlanetsSerializer, status: :ok
    end

    def create
        scientist = Scientist.create!(sci_params)
        render json: scientist, status: :created
    end

    def update
        scientist = find_sci
        scientist.update!(sci_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = find_sci
        scientist.destroy
        head :no_content
    end

    private

    def find_sci
        Scientist.find(params[:id])
    end

    def sci_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
