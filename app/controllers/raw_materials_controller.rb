class RawMaterialsController < ApplicationController
   
    before_action :set_raw_material, only: [:show, :update, :destroy]

    #find material by id before show, update and destroy actions
    before_action :find_raw_material, only: [:show, :update, :destroy]

    def index
        raw_materials = RawMaterial.all
        render json: RawMaterialBlueprint.render(raw_materials, view: :normal), status: :ok
    end

    def create
        raw_material = RawMaterial.create(raw_material_params)
        if raw_material.save
            render json: raw_material, status: :created
        else
            render json: raw_material.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: RawMaterialBlueprint.render(set_raw_material, view: :normal), status: :ok
    end

    def update
        if set_raw_material.update(raw_material_params)
            render json: RawMaterialBlueprint.render(set_raw_material, view: :extended), status: :ok
        else
            render json: raw_material.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if set_raw_material.destroy
            render json: { message: 'Successfully deleted Raw Material' }, status: :ok
        else 
            render json: { error: 'Unable to delete Raw Material' }, status: :unprocessable_entity
        end
    end

    private

    #method for setting current raw material
    def set_raw_material
        raw_material = RawMaterial.find(params[:id])
    end

    #method permits only the material_name parameter
    def raw_material_params
        params.require(:raw_material).permit(:material_name)
    end
end
