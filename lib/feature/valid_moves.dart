import 'package:chess/components/piece.dart';
import 'package:chess/feature/helper_methods.dart';

List<List<int>> calculateRawValidMoves(int row, int col,
    ChessPiece? selectedPiece, List<List<ChessPiece?>> board) {
  List<List<int>> candidateMoves = [];

  // different direction based on their color
  int direction = selectedPiece!.isWhite ? -1 : 1;

  switch (selectedPiece.type) {
    //~ 1. Pawn
    case ChessPieceType.pawn:
      // Pawn().validMoves(row, col, selectedPiece, board, direction, candidateMoves);
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
      if (isInBoard(row + direction, col + 1) &&
          board[row + direction][col + 1] != null &&
          board[row + direction][col + 1]!.isWhite != selectedPiece.isWhite) {
        candidateMoves.add([row + direction, col + 1]);
      }
      if (isInBoard(row + direction, col - 1) &&
          board[row + direction][col - 1] != null &&
          board[row + direction][col - 1]!.isWhite != selectedPiece.isWhite) {
        candidateMoves.add([row + direction, col - 1]);
      }

    //~ 2. Rook
    case ChessPieceType.rook:
      var rookDirection = [
        [-1, 0], // up
        [1, 0], // down
        [0, -1], // left
        [0, 1], // right
      ];

      for (var direction in rookDirection) {
        var i = 1; // i is the number of squares away from the current square

        // keep moving in this direction until we hit a piece or the edge of the board
        while (true) {
          var nextRow = row + i * direction[0];
          var nextCol = col + i * direction[1];

          // check if the square is in the board
          if (!isInBoard(nextRow, nextCol)) {
            break;
          }
          // check if the square has a piece
          if (board[nextRow][nextCol] != null) {
            // check if the piece is of opposite color
            if (board[nextRow][nextCol]!.isWhite != selectedPiece.isWhite) {
              candidateMoves.add([nextRow, nextCol]); // kill
            }
            break; // stop searching in this direction
          }
          candidateMoves.add([nextRow, nextCol]);
          i++; // move to the next square
        }
      }

    // ~ 3. Knight
    case ChessPieceType.knight:
      // move in an L shape
      var knightDirections = [
        [2, -1], // up left
        [2, 1], // up right
        [-2, -1], // down left
        [-2, 1], // down right
        [1, -2], // left up
        [-1, -2], // left down
        [1, 2], // right up
        [-1, 2], // right down
      ];
      for (var direction in knightDirections) {
        // keep moving in this direction until we hit a piece or the edge of the board
        var nextRow = row + direction[0];
        var nextCol = col + direction[1];

        // check if the square is in the board
        if (!isInBoard(nextRow, nextCol)) {
          continue;
        }
        // check if the square has a piece
        if (board[nextRow][nextCol] != null) {
          // check if the piece is of opposite color
          if (board[nextRow][nextCol]!.isWhite != selectedPiece.isWhite) {
            candidateMoves.add([nextRow, nextCol]); // kill
          }
          continue; // stop searching in this direction
        }
        candidateMoves.add([nextRow, nextCol]);
      }

    //~ 4. Bishop
    case ChessPieceType.bishop:
      var bishopDirections = [
        [1, 1], // up left
        [1, -1], // up right
        [-1, 1], // down left
        [-1, -1], // down right
      ];
      for (var direction in bishopDirections) {
        var i = 1; // i is the number of squares away from the current square

        // keep moving in this direction until we hit a piece or the edge of the board
        while (true) {
          var nextRow = row + i * direction[0];
          var nextCol = col + i * direction[1];

          // check if the square is in the board
          if (!isInBoard(nextRow, nextCol)) {
            break;
          }
          // check if the square has a piece
          if (board[nextRow][nextCol] != null) {
            // check if the piece is of opposite color
            if (board[nextRow][nextCol]!.isWhite != selectedPiece.isWhite) {
              candidateMoves.add([nextRow, nextCol]); // kill
            }
            break; // stop searching in this direction
          }
          candidateMoves.add([nextRow, nextCol]);
          i++; // move to the next square
        }
      }

    //~ 5. Queen
    case ChessPieceType.queen:
      var queenDirections = [
        [-1, 0], // up
        [1, 0], // down
        [0, -1], // left
        [0, 1], // right
        [1, 1], // up left
        [1, -1], // up right
        [-1, 1], // down left
        [-1, -1], // down right
      ];
      for (var direction in queenDirections) {
        var i = 1; // i is the number of squares away from the current square

        // keep moving in this direction until we hit a piece or the edge of the board
        while (true) {
          var nextRow = row + i * direction[0];
          var nextCol = col + i * direction[1];

          // check if the square is in the board
          if (!isInBoard(nextRow, nextCol)) {
            break;
          }
          // check if the square has a piece
          if (board[nextRow][nextCol] != null) {
            // check if the piece is of opposite color
            if (board[nextRow][nextCol]!.isWhite != selectedPiece.isWhite) {
              candidateMoves.add([nextRow, nextCol]); // kill
            }
            break; // stop searching in this direction
          }
          candidateMoves.add([nextRow, nextCol]);
          i++; // move to the next square
        }
      }

    //~ 6. King
    case ChessPieceType.king:
      var kingDirections = [
        [-1, 0], // up
        [1, 0], // down
        [0, -1], // left
        [0, 1], // right
        [-1, -1], // up left
        [-1, 1], // up right
        [1, -1], // down left
        [1, 1], // down right
      ];
      for (var direction in kingDirections) {
        // keep moving in this direction until we hit a piece or the edge of the board

        var nextRow = row + direction[0];
        var nextCol = col + direction[1];

        // check if the square is in the board
        if (!isInBoard(nextRow, nextCol)) {
          continue;
        }
        // check if the square has a piece
        if (board[nextRow][nextCol] != null) {
          // check if the piece is of opposite color
          if (board[nextRow][nextCol]!.isWhite != selectedPiece.isWhite) {
            candidateMoves.add([nextRow, nextCol]); // kill
          }
          continue; // stop searching in this direction
        }
        candidateMoves.add([nextRow, nextCol]);
      }
  }
  return candidateMoves;
}

List<List<int>> calculateRealValidMoves(
    int row,
    int col,
    ChessPiece? piece,
    bool checkSimulation,
    List<List<ChessPiece?>> board,
    List<int> whiteKingPosition,
    List<int> blackKingPosition) {
  List<List<int>> realValidMoves = [];
  List<List<int>> candidateMoves = calculateRawValidMoves(
      row, col, piece, board); // get all the candidate moves

  // filter out the moves that would put the king in check
  if (checkSimulation) {
    for (var move in candidateMoves) {
      int endRow = move[0];
      int endCol = move[1];
      if (simulatedMiveIsSafe(piece!, row, col, endRow, endCol, board,
          whiteKingPosition, blackKingPosition)) {
        realValidMoves.add(move);
      }
    }
  } else {
    realValidMoves = candidateMoves;
  }
  return realValidMoves;
}

// simulate the move and see if the king is in check
bool simulatedMiveIsSafe(
    ChessPiece piece,
    int startrow,
    int startcol,
    int endRow,
    int endCol,
    List<List<ChessPiece?>> board,
    List<int> whiteKingPosition,
    List<int> blackKingPosition) {
  // save the current state of the board
  ChessPiece? originalPositionPiece = board[endRow][endCol];

  // if the piece is a king, update the king's position to the new position and save the old one
  List<int> originalKingPosition = [];
  if (piece.type == ChessPieceType.king) {
    originalKingPosition =
        piece.isWhite ? whiteKingPosition : blackKingPosition;

    // update the king's position
    if (piece.isWhite) {
      whiteKingPosition = [endRow, endCol];
    } else {
      blackKingPosition = [endRow, endCol];
    }
  }

  // simulate the move
  board[endRow][endCol] = piece;
  board[startrow][startcol] = null;

  // check if our own king is under attack
  bool isSafe =
      isKingInCheck(piece.isWhite, board, whiteKingPosition, blackKingPosition);

  // restore the board to the original state
  board[startrow][startcol] = piece;
  board[endRow][endCol] = originalPositionPiece;

  //  if the piece is a king, restore the king's position
  if (piece.type == ChessPieceType.king) {
    if (piece.isWhite) {
      whiteKingPosition = originalKingPosition;
    } else {
      blackKingPosition = originalKingPosition;
    }
  }

  return !isSafe;
}

bool isKingInCheck(bool isWhiteKing, List<List<ChessPiece?>> board,
    List<int> whiteKingPosition, List<int> blackKingPosition) {
  List<int> kingPosition = isWhiteKing ? whiteKingPosition : blackKingPosition;

  // check if any of the opponent's pieces can attack the king
  for (var row = 0; row < 8; row++) {
    for (var col = 0; col < 8; col++) {
      // skip if the square is  empty or has a piece of the same color
      if (board[row][col] == null || board[row][col]!.isWhite == isWhiteKing) {
        continue;
      }

      List<List<int>> moves = calculateRealValidMoves(row, col,
          board[row][col]!, false, board, whiteKingPosition, blackKingPosition);

      // check if any of the moves is a attack on the king
      if (moves.any((element) =>
          element[0] == kingPosition[0] && element[1] == kingPosition[1])) {
        return true;
      }
    }
  }
  return false;
}

//  IS CHECKMATE
bool isCheckMate(bool isWhiteKing, List<List<ChessPiece?>> board,
    List<int> whiteKingPosition, List<int> blackKingPosition) {
  // if the king is not in check, it is not checkmate
  if (!isKingInCheck(
      isWhiteKing, board, whiteKingPosition, blackKingPosition)) {
    return false;
  }

  // if there is at least one valid move, it is not checkmate
  for (var row = 0; row < 8; row++) {
    for (var col = 0; col < 8; col++) {
      // skip if the square is empty or has a piece of the same color
      if (board[row][col] == null || board[row][col]!.isWhite != isWhiteKing) {
        continue;
      }

      List<List<int>> moves = calculateRealValidMoves(row, col, board[row][col],
          true, board, whiteKingPosition, blackKingPosition);

      // check if any of the moves is a valid move
      if (moves.isNotEmpty) {
        return false;
      }
    }
  }

  // if there are no valid moves, it is checkmate
  return true;
}
