class TenantsController < ApplicationController

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def show 
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def create
        newTenant = Tenant.create(tenant_params)
        render json: newTenant, status: :created
    end

    def update
        tenant = Tenant.find_by_id(params[:id])
        if tenant
            tenant.update(tenant_params)
            render json: tenant
        else
            render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    def destroy
        deleteTenant = Tenant.find_by(id: params[:id])
        if deleteTenant
            deleteTenant.destroy
            head :no_content
        else
            render json: { error: "Tenant not found" }, status: :not_found
        end
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end
end
