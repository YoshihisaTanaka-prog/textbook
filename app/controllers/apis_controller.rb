class ApisController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def teacher
        if params[:search].blank?
            teachers = Teacher.where(teacher: true)
        else
            teachers = Teacher.where(teacher: true).where("name LIKE ?", "%" + params[:search] + "%")
        end
        @teachers = []
        teachers.each do |teacher|
            @teachers << teacher.hash_format
        end
        render json: @teachers
    end

    def solution

        selection = Selection.find_by(id: params[:selection])

        if params[:text].blank?
            solutions = Solution.all.order(:kana)
        elsif !params[:kana].blank?
            solutions = Solution.where("title LIKE ? OR kana LIKE ? ","%#{params[:text]}%","%#{params[:kana]}%").order(:kana)
        else
            solutions = []
        end
        @solutions = []
        if selection
            solutions.each do |solution|
                if !selection.all_solutions_id.include?(solution.id)
                    @solutions << solution
                end
            end
        end
        render json: @solutions.to_json
    end

end
