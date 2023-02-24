class ApplicationController < ActionController::Base

    def confirm_teacher
        if current_teacher.nil?
            redirect_to new_teacher_session_path
        elsif !current_teacher.teacher
            logger.error current_teacher.to_json
            redirect_to new_teacher_session_path
        end        
    end

    def confirm_admin
        if current_teacher.nil?
            redirect_to new_teacher_session_path
        elsif !current_teacher.admin
            redirect_to new_teacher_session_path
        end        
    end

    private
    def after_sign_in_path_for(a)
        root_path
    end

    def after_sign_out_path_for(a)
        new_teacher_session_path # ログアウト後に遷移するpathを設定
    end

end
