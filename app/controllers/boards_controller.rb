class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  def index
    @boards = self.all_boards(current_user_id)
  end

  def show
  end

  def new
    @board = current_user.boards.new
  end

  def create
    Board.create_board(board_params, current_user_id)
    redirect_to boards_path
  end

  def edit
  end

  def update
    Board.update_board(@board.id, board_params)
    redirect_to boards_path
  end

  def destroy
    Board.delete_board(@board.id)
    redirect_to boards_path
  end

  private
    def set_board
      @board = Board.one_board(params[:id])
    end

    def board_params
      params.require(:boards).permit(:name)
    end


end
