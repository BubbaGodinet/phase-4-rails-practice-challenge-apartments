class LeasesController < ApplicationController

    def create
        newLease = Lease.create(lease_params)
        render json: newLease, status: :created
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
            lease.destroy
            head :no_content
        else
            render json: { error: "Lease not found" }, status: :not_found
        end
    end

    private 

    def lease_params
        params.permit(:rent)
    end
end

