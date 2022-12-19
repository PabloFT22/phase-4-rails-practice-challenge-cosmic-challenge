class ScientistsController < ApplicationController

    def index
        render json: Scientist.all, status: :ok
    end

    def show
        find_scientist =  Scientist.find_by(id: params[:id])
        if find_scientist
            render json: find_scientist, serializer: ScientistShowSerializer
        else
            render json: { "error": "Scientist not found" }, status: :not_found
        end
    end

    def create
        scientist_create = Scientist.create(scientist_params)
        if scientist_create.valid?
            render json: scientist_create, status: :created
        else
            render json: {"errors": scientist_create.errors.full_messages}, status: :unprocessable_entity #
        end
    end

    def update #
        update_scientist = Scientist.find_by(id: params[:id])

        if update_scientist
            update_scientist.update(edit_scientist_params)
            if update_scientist.valid?
                render json: update_scientist, status: :accepted
            else
                render json: { "errors": update_scientist.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { "error": "Scientist not found" }, status: :not_found
        end
        # update_scientist.update(edit_scientist_params)
        # if update_scientist.valid?
        #     render json: update_scientist
        # else
        #     render json: { "errors": update_scientist.errors.full_messages }, status: :not_found
        # end
    end

    def destroy
        destroy_scientist = Scientist.find_by(id: params[:id])
        if destroy_scientist
            destroy_scientist.destroy
            # render json: {}
            head :no_content
        else
            render json: { "error": "Scientist not found" }, status: :not_found
        end
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def edit_scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
