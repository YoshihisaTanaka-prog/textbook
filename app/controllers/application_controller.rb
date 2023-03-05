class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :affiliation, :introducer])
    end

    def confirm_teacher
        if current_teacher.nil?
            redirect_to new_teacher_session_path
        elsif !current_teacher.teacher
            logger.error current_teacher.to_json
            session[:auth] = "teacher"
            redirect_to non_auth_path
        end        
    end

    def confirm_admin
        if current_teacher.nil?
            redirect_to new_teacher_session_path
        elsif !current_teacher.admin
            session[:auth] = "admin"
            redirect_to non_auth_path
        end        
    end

    private
    def after_sign_in_path_for(a)
        if params[:commit] == "Sign up"
            logger.debug a.to_json
            IntroducerMailer.send_mail(a).deliver_now
        end
        root_path
    end

    def after_sign_out_path_for(a)
        new_teacher_session_path # ログアウト後に遷移するpathを設定
    end

    def after_sign_up_path_for(a)
        loggse.debug a.to_json
        mains_path # ログアウト後に遷移するpathを設定
    end

end
