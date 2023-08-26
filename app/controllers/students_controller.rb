class StudentsController < ApplicationController
     def index
          students = Student.all
          render json: students
     end

     def show
          student = Student.find(params[:id])
          render json: student
     end
end

class GradesController < AplicationController
     def index
          grades = Grade.all
          render json: grades
     end

     def create
          grade = Grade.new(grade_params)
          if grade.save
               render json: grade, status: :created
          else
               render json: grade.errors, status: :unprocessable_entity
          end
     end

     private

     def grade_params
          params.require(:post).permit(:student_id, :subject, :value)
     end
end