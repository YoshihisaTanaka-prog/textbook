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
        elsif params[:kana].blank?
            solutions = Solution.where("title LIKE ? ","%#{params[:text]}%").order(:kana)
        else
            solutions = Solution.where("title LIKE ? OR kana LIKE ? ","%#{params[:text]}%","%#{params[:kana]}%").order(:kana)
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

    def main
        main = Main.find_by(id: params[:id])
        if main
            render json: main.hash_format
        else
            render json: {}
        end
    end

    def subject
        subjects = []
        Subject.all.order(:id).each do |subject|
            subjects << subject.hash_format
        end
        render json: subjects
    end

    def email
        @teacher = []
        Teacher.where(teacher: true).each do |t|
            @teacher << t.email
        end
        render json: @teacher
    end

end
