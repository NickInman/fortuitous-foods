class NotesController < ApplicationController

  def create
    @user = User.find_by(id: session['user_id'])
    @note = current_user.notes.build(note_params)
    if @note.save
      render :json => @note.as_json(include: :user)
    else
      render "users/show"
    end
  end

  private
  def note_params
    params.require(:note).permit(:content, :user_id)
  end
end
