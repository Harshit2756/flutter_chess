import 'package:chess/components/dead_piece.dart';
import 'package:chess/components/piece.dart';
import 'package:chess/components/square.dart';
import 'package:chess/feature/initial_board.dart';
import 'package:chess/feature/valid_moves.dart';
import 'package:chess/feature/helper_methods.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  //  A 2-dimensional list representing the board with each position possibly containing a piece
  late List<List<ChessPiece?>> board;

  //  The currently selected piece on the board
  //  If no piece is selected, this will be null
  ChessPiece? selectedPiece;

  //  The row and column of the selected piece
  //  If no piece is selected, these will be -1
  int selectedRow = -1;
  int selectedCol = -1;

  // a list of valid moves for the selected piece each move is represented by a list of two integers, the row and column of the move
  List<List<int>> validMoves = [];

  // a list of white pieces captured by black
  List<ChessPiece> whiteCapturedPieces = [];

  // a list of black pieces captured by white
  List<ChessPiece> blackCapturedPieces = [];

  // a bool to indicate if it is white's turn
  bool isWhiteTurn = true;

  // initial position of kings (keep track of them to check for checkmate)
  List<int> whiteKingPosition = [7, 4];
  List<int> blackKingPosition = [0, 4];
  bool isCheck = false;

  // Initialize the board
  @override
  void initState() {
    super.initState();
    //  Initialize the board
    board = initialBoard();
  }

  // User selected a piece
  void pieceSelected(int row, int col) {
    setState(() {
      //  no piece is selected, this is the first tap
      if (board[row][col] != null && selectedPiece == null) {
        if (board[row][col]!.isWhite == isWhiteTurn) {
          selectedPiece = board[row][col];
          selectedRow = row;
          selectedCol = col;
        }
      }

      // there is a pice selected and the user tapped on another piece of the same color
      else if (board[row][col] != null &&
          board[row][col]!.isWhite == selectedPiece!.isWhite) {
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }

      // if there is a selected piece and the user tapped on a square that is a valid move
      else if (selectedPiece != null &&
          validMoves.any((element) => element[0] == row && element[1] == col)) {
        movePiece(row, col);
      }

      // if a peice is selected ,calculate the valid moves
      if (selectedPiece != null) {
        validMoves = calculateRealValidMoves(selectedRow, selectedCol,
            selectedPiece!, true, board, whiteKingPosition, blackKingPosition);
      }
    });
  }

  // Move Piece
  void movePiece(int newRow, int newCol) {
    //  check if the move is a capture
    if (board[newRow][newCol] != null) {
      //  check if the piece is white or black
      if (board[newRow][newCol]!.isWhite) {
        whiteCapturedPieces.add(board[newRow][newCol]!);
      } else {
        blackCapturedPieces.add(board[newRow][newCol]!);
      }
    }

    // check if the piece being moved is a king
    if (selectedPiece!.type == ChessPieceType.king) {
      //  update the king's position
      if (selectedPiece!.isWhite) {
        whiteKingPosition = [newRow, newCol];
      } else {
        blackKingPosition = [newRow, newCol];
      }
    }

    //  move the piece to the new square
    board[newRow][newCol] = selectedPiece;
    board[selectedRow][selectedCol] = null;

    // see if the king is in check
    if (isKingInCheck(
        !isWhiteTurn, board, whiteKingPosition, blackKingPosition)) {
      isCheck = true;
    } else {
      isCheck = false;
    }

    //  reset the selected piece
    setState(() {
      selectedPiece = null;
      selectedRow = -1;
      selectedCol = -1;
      validMoves = [];
    });

    // Check if it's checkmate
    if (isCheckMate(
        !isWhiteTurn, board, whiteKingPosition, blackKingPosition)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('CHECK MATE!'),
          actions: [
            TextButton(
              onPressed: resetGame,
              child: const Text('Play Again'),
            ),
          ],
        ),
      );
    }

    //  change the turn
    isWhiteTurn = !isWhiteTurn;
  }

  // RESET TO NEW GAME
  void resetGame() {
    Navigator.pop(context);
    board = initialBoard();
    isCheck = false;
    isWhiteTurn = true;
    whiteCapturedPieces.clear();
    blackCapturedPieces.clear();
    whiteKingPosition = [7, 4];
    blackKingPosition = [0, 4];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // ~ Captured Pieces by Black
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: blackCapturedPieces.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8),
              itemBuilder: (context, index) => DeadPiece(
                imagePath: blackCapturedPieces[index].imagePath,
                isWhite: blackCapturedPieces[index].isWhite,
              ),
            ),
          ),

          // ~ Turn Indicator and reset button
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.transparent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    isCheck
                        ? 'check'
                        : isWhiteTurn
                            ? 'White\'s Turn'
                            : 'Black\'s Turn',
                    style: TextStyle(
                      color: isCheck
                          ? Colors.red
                          : isWhiteTurn
                              ? Colors.white
                              : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: resetGame,
                  //   child: const Text('Reset'),
                  // ),
                ],
              ),
            ),
          ),

          // ~ Chessboard
          Expanded(
            flex: 3,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8 * 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8),
              itemBuilder: (context, index) {
                int row = index ~/ 8;
                int col = index % 8;

                //  check if this square is selected
                bool isSelected = (selectedRow == row && selectedCol == col);

                // check if this square is a valid move
                bool isValidMove = false;
                for (var move in validMoves) {
                  if (move[0] == row && move[1] == col) {
                    isValidMove = true;
                    break;
                  }
                }
                return Square(
                  isWhite: isWhite(index),
                  piece: board[row][col],
                  isSelected: isSelected,
                  onTap: () => pieceSelected(row, col),
                  isValidMove: isValidMove,
                );
              },
            ),
          ),

          // ~ Captured Pieces by White
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: whiteCapturedPieces.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8),
              itemBuilder: (context, index) => DeadPiece(
                imagePath: whiteCapturedPieces[index].imagePath,
                isWhite: whiteCapturedPieces[index].isWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
