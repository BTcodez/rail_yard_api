class RawMaterialsController < ApplicationController
    #find material by id before show, update and destroy actions
    before_action :find_raw_material, only: [:show, :update, :destroy]

    def create
        raw_material = RawMaterial.new(raw_material_params)
        if raw_material.save
            render json: raw_material, status: :created
        else
            render json: raw_material.errors, status: :unprocessable_entity
        end
    end

    def index
        raw_materials = RawMaterial.all
        render json: raw_materials, status: :ok
    end

    def show
        render json: @raw_material, status: :ok
    end

    def update
        render json: @raw_material.update(raw_material_params), status: :ok
    end

    def destroy
        @raw_material.destroy
    end

    private
    #method finds the raw material by id before show, update and destroy actions
    def find_raw_material
        @raw_material = RawMaterial.find(params[:id])
    end
    #method permits only the material_name parameter
    def raw_material_params
        params.require(:raw_material).permit(:material_name)
    end
end
