import 'package:chess/components/piece.dart';

class Knight {
  void initialPosition(List<List<ChessPiece?>> newBoard) {
    // ~ Add the black knights
    newBoard[0][1] = ChessPiece(
      ChessPieceType.knight,
      false,
      'assets/Images/black/knight.png',
    );
    newBoard[0][6] = ChessPiece(
      ChessPieceType.knight,
      false,
      'assets/Images/black/knight.png',
    );
    // ~ Add the white knights
    newBoard[7][1] = ChessPiece(
      ChessPieceType.knight,
      true,
      'assets/Images/white/knight.png',
    );
    newBoard[7][6] = ChessPiece(
      ChessPieceType.knight,
      true,
      'assets/Images/white/knight.png',
    );
  }

  void validMoves(
      int row,
      int col,
      ChessPiece selectedPiece,
      List<List<ChessPiece?>> board,
      int direction,
      List<List<int>> candidateMoves) {}
}
