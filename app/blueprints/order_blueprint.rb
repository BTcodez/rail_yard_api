# frozen_string_literal: true

class OrderBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :car_id, :raw_material_id
    end

    view :extended do
        include_view :normal
        fields :requested_date, :received_date, :extraction_start, :extraction_end, :release_date, :user_id
    end

end