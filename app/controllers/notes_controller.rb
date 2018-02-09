class NotesController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
 def create
 @note = @book.notes.new(note_params)
 if @note.save
 redirect_to @book, notice: 'Nota creada correctamente.'
 else
 redirect_to @book, alert: 'Imposible crear una nota!.'
 end
 end
 def destroy
 @note = @book.notes.find(params[:id])
 @note.destroy
 redirect_to @book, notice: 'Nota eliminada correctamente.'
 end
 private
 def set_book
 @book = Book.find(params[:book_id])
 end
 def note_params
 params.require(:note).permit(:title, :note)
 end 
end
