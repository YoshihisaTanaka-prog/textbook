class SolutionSelectionController < ApplicationController
    before_action :confirm_teacher

    def change_status
        ss = SolutionSelection.new(ss_params)
        if ss.save
            selection = Selection.find_by(id: ss.selection_id )
            redirect_to selection
        end
    end

    private
    # Only allow a list of trusted parameters through.
    def ss_params
        params.require(:solution_selection).permit(:solution_id, :selection_id)
    end
end
