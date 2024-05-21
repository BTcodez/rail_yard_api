# frozen_string_literal: true

class OrderBlueprint < Blueprinter::Base
    identifier :id
        fields :car_id, :requested_date, :received_date, :extraction_start, :extraction_end, :release_date
    view :normal do
        association :user, blueprint: UserBlueprint, view: :normal
        association :raw_material, blueprint: RawMaterialBlueprint, view: :normal
    end

    view :extended do
        include_view :normal
        fields :raw_material_id, :material_name
    end
end