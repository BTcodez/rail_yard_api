# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id
    
    view :normal do
        fields :name
    end

    view :extended do
        include_view :normal
        fields :email, :user_type
    end
end
