class Board < ApplicationRecord
  belongs_to :user
  has_many :lists

  def self.all_boards(user_id)
    Board.find_by_sql("
      SELECT *
      FROM boards AS b
      WHERE b.user_id = #{user_id}"
    )
  end

  def self.one_board(board_id)
    Board.find_by_sql(["
      SELECT *
      FROM :boards AS b
      WHERE b.id = ?
      ", customer_id]).first
    end
    
  def
    self.create_board(p, id)
    Board.find_by_sql(["
      INSERT INTO boards (name)
      VALUES (:name);
      ", {
        name: p[:name]
      }])
    end

  def self.update_board(board_id, p)
    Board.find_by_sql(["
      UPDATE boards as b
      SET name = ?
      WHERE b.id = ?
      ;", p[:name])
    end
  
  def self.delete_board(board_id)
    Board.find_by_sql(["
      DELETE FROM boards AS b
      WHERE b.id = ?
      ;", board_id])
    end
    

end
