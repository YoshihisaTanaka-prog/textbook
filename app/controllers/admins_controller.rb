class AdminsController < ApplicationController
  before_action :confirm_admin, only: %i[ top database allow_admin ]
  before_action :confirm_teacher, only: %i[ teacher allow_teacher ]

  def top
  end

  def teacher
    if params[:id]
      @teachers = [Teacher.find(params[:id])]
    else
      @teachers = Teacher.all
    end
  end

  def allow_teacher
    @teacher = Teacher.find(params[:id])
    @teacher.teacher = true
    @teacher.save
    redirect_to admins_teacher_path
  end

  def allow_admin
    @teacher = Teacher.find(params[:id])
    @teacher.teacher = true
    @teacher.admin = true
    @teacher.save
    redirect_to admins_teacher_path
  end

  def database
    @mains = Main.all.to_json
    @selections = Selection.all.to_json
    @ss = SolutionSelection.all.to_json
    @solutions = Solution.all.to_json
    @subjects = Subject.all.to_json
  end

end
