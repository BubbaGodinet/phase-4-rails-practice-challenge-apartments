class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show 
        apartment = Apartment.find(params[:id])
        render json: apartment
    end

    def create
        newApt = Apartment.create(apt_params)
        render json: newApt, status: :created
    end

    def update
        apartment = Apartment.find_by_id(params[:id])
        if apartment
            apartment.update(apt_params)
            render json: apartment
        else
            render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    private 

    def apt_params
        params.permit(:number)
    end
end
