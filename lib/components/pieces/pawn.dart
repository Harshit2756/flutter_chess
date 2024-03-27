import 'package:chess/components/piece.dart';
import 'package:chess/feature/helper_methods.dart';

class Pawn{
  void initialPosition(List<List<ChessPiece?>> newBoard){
    for (var i = 0; i < 8; i++) {
      // ~Add the black pawns
      newBoard[1][i] = ChessPiece(
        ChessPieceType.pawn,
        false,
        'assets/Images/Pawn_48.png',
      );
      // ~Add the white pawns
      newBoard[6][i] = ChessPiece(
        ChessPieceType.pawn,
        true,
        'assets/Images/Pawn_48.png',
      );
    }
  }

  void validMoves(int row, int col, ChessPiece selectedPiece,
      List<List<ChessPiece?>> board, int direction, List<List<int>> candidateMoves){
    // 1 square forward if the square is empty
    if (isInBoard(row + direction, col) &&
        board[row + direction][col] == null) {
      candidateMoves.add([row + direction, col]);
    }

    // 2 squares forward if the pawn is in its starting position
    if ((selectedPiece.isWhite && row == 6) ||
        (!selectedPiece.isWhite && row == 1)) {
      // check if the square is next 2 squares and just next square is empty
      if (isInBoard(row + 2 * direction, col) &&
          board[row + direction][col] == null) {
        candidateMoves.add([row + 2 * direction, col]);
      }
    }

    // capture diagonally
    // check if the square is in the board and if there is a piece and it is of opposite color
    if (isInBoard(row + direction, col + direction) &&
        board[row + direction][col + direction] != null &&
        board[row + direction][col + direction]!.isWhite !=
            selectedPiece.isWhite) {
      candidateMoves.add([row + direction, col + direction]);
    }
  }
}