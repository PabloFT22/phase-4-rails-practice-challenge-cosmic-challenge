class MissionsController < ApplicationController

    def create
        new_mission = Mission.create(new_mission_params)
        if new_mission.valid?
            render json: new_mission.planet, status: :created
        else
            render json: {"errors": new_mission.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def new_mission_params
        params.permit(:name, :planet_id, :scientist_id)
    end

end
