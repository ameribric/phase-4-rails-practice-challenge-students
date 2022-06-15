class InstructorsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid
    
    def index
        instructors = Instructor.all
        render json: instructors, status: 200
    end

    def show
    instructor = Instructor.find(params[:id])
    render json: instructor, status: 200
    end

    def update
        instructor = instructor.find(params[:id])
        instructor.update(instructor_params)
        render json: instructor, status: 200
    end

    def create
         instructor = instructor.create(instructor_params)
         render json: instructor, status: 200
    end

    def destroy
    instructor = instructor.find(params[:id])
    instructor.destroy
    head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def render_not_found
        render json: { error: "Not found"}, status: :not_found
    end

    def render_not_valid
        render json:  { error: "Not valid, must include a name"}, status: 422
    end

end
