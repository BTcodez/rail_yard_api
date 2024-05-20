# frozen_string_literal: true

class OrderBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :car_id, :material_name
    end

    view :extended do
        include_view :normal
        fields :raw_material_id, :requested_date, :received_date, :extraction_start, :extraction_end, :release_date, :user_id
    end
end