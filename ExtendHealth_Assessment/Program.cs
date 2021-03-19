using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace ExtendHealth_Assessment
{
    class Program
    {
        static void Main(string[] args)
        {
            // Number of Unique email addresses
            //string[] addresses =
            //{
            //    "first.m.last@somewhere.com",
            //    "firstmlast@somewhere.com",
            //    "team.1+bob@somewhere.com",
            //    "team1+jill+bob@somewhere.com",
            //    "team2@somewhere.com",
            //    "team2@some.where.com"
            //};

            //Solution.NumberOfUniqueEmailAddresses(addresses);

            // Tic Tac Toe Game
            Console.WriteLine("To start a Tic Tac Toe game, enter a value for n");
            int n = Convert.ToInt32(Console.ReadLine());
            Solution.TicTacToe game = new Solution.TicTacToe(n);
        }
    }

    public class Solution
    {
        /// <summary>
        /// Determins the number of unique email addresses base on the provided criteria
        /// </summary>
        /// <param name="emails"></param>
        /// <returns></returns>
        public static int NumberOfUniqueEmailAddresses(string[] emails)
        {
            Dictionary<string, int> addressParts = new Dictionary<string, int>();
            int i = 0;

            foreach (var item in emails)
            {
                var idx = item.IndexOf('@');
                var left = item.Substring(0, idx);
                if (left.Contains('.'))
                    left = Regex.Replace(left, @"[.]", "");
                var right = item.Substring(idx + 1);
                if (left.Contains('+'))
                    left = left.Substring(0, left.IndexOf('+'));

                var address = left + '@' + right;
                if (!addressParts.ContainsKey(address))
                    addressParts.Add(address, 1);
                i++;
            }

            return addressParts.Count;
        }

        public class TicTacToe
        {
            private enum state
            {
                B = 0,
                X = 1, // Player 1
                O = 2  // Player 2
            };

            private static Dictionary<string, int> Board = new Dictionary<string, int>();
            /// <summary>
            /// Created a Tic Tac Tow game board
            /// </summary>
            /// <param name="n">nxn dimension for the game board</param>
            public TicTacToe(int n)
            {

                int p1 = (int)state.X;
                int p2 = (int)state.O;
                int move = (p1 ^ p2);
                int player = p1;
                CreateBoard(n);
                bool winner = false;
                RemainingPlays(n);
                while (winner != true)
                {
                    Console.WriteLine($"Player {player}, it's your turn. Enter your space separated x y values");
                    string[] cood = Console.ReadLine().TrimEnd().Split(" ");
                    int x = Convert.ToInt32(cood[0]);
                    int y = Convert.ToInt32(cood[1]);
                    var turn = PlacePiece(x, y, player, n);
                    if (turn == -1)
                    {
                        Console.WriteLine("Try another move");
                        cood = Console.ReadLine().TrimEnd().Split(" ");
                        x = Convert.ToInt32(cood[0]);
                        y = Convert.ToInt32(cood[1]);
                    }
                    RemainingPlays(n);
                    if (turn == 1  || turn == 2)
                    {
                        winner = true;
                        Console.WriteLine($"Player {player} is the winner");
                        break;
                    }
                    else if (turn == 3)
                    {
                        winner = true;
                        Console.WriteLine($"Game is a draw");
                        break;
                    }
                    player ^= move;
                }
            }

            /// <summary>
            /// Place a piece on the game board
            /// </summary>
            /// <param name="row">row to place a piece</param>
            /// <param name="col">column to place a piece</param>
            /// <param name="player">the player (1 or 2) the piece is for</param>
            /// <returns>0 = no winner, 1 = player 1 won, 2 = player 2 won</returns>
            public int PlacePiece(int row, int col, int player, int n)
            {
                var key = $"({row},{col})";
                if (Board[key] == (int)state.B)
                    Board[key] = player;
                else
                {
                    Console.WriteLine("That square is already occupied.");
                    return -1;
                }
                if (IsDiagonalWin(player, n))
                    return player;
                if (IsHorizontalWin(player, n))
                    return player;
                if (IsVerticalWin(player, n))
                    return player;
                if (isDraw(n))
                    return 3;
                return 0;
            }

            /// <summary>
            /// Display grid with x and y coodinates (x, y)
            /// replaces with X and O after each turn
            /// </summary>
            /// <param name="n"></param>
            private static void RemainingPlays(int n)
            {
                var game = new List<string>();
                int count = 1;
                string piece = "";

                foreach (var item in Board)
                {
                    piece = item.Value != 0 ? item.Value == 1 ? "  X  " : "  O  " : item.Key;
                    if (count % n == 0)
                    {
                        Console.Write(piece);
                        Console.WriteLine();
                    }
                    else
                        Console.Write(piece + " | ");
                    count++;
                    piece = "";
                }
                Console.WriteLine();
            }

            /// <summary>
            /// Creates the boad with (x, y) values
            /// and stores the player selection once played
            /// </summary>
            /// <param name="n"></param>
            private static void CreateBoard(int n)
            {
                for (int i = 0; i < n; i++)
                {
                    for (int j = 0; j < n; j++)
                    {
                        var key = $"({i},{j})";
                        if (!Board.ContainsKey(key))
                            Board.Add(key, (int)state.B);
                    }
                }
            }

            /// <summary>
            /// Checks for a diagnol win
            /// </summary>
            /// <param name="player"></param>
            /// <param name="n"></param>
            /// <returns></returns>
            private static bool IsDiagonalWin(int player, int n)
            {
                int x, y;

                for (x = 0, y = x; x < n; x++, y++)
                {
                    var key = $"({x},{y})";
                    Board.TryGetValue(key, out int value);
                    if (value != player)
                        return false;
                }


                for (x = n - 1, y = x; x >= 0; x--, y--)
                {
                    var key = $"({x},{y})";
                    Board.TryGetValue(key, out int value);
                    if (value != player)
                        return false;
                }
                return true;
            }

            /// <summary>
            /// Check for a horizontal win
            /// </summary>
            /// <param name="player"></param>
            /// <param name="n"></param>
            /// <returns></returns>
            private static bool IsHorizontalWin(int player, int n)
            { 
                for (int y = 0; y < n; y++)
                {
                    int count = 0;
                    for (int x = 0; x < n; x++)
                    {
                        var key = $"({x},{y})";
                        if (Board[key] == player)
                            count++;
                    }
                    if (count == n)
                        return true;
                }
                return false;
            }
            
            /// <summary>
            /// Checks for a vertical win
            /// </summary>
            /// <param name="player"></param>
            /// <param name="n"></param>
            /// <returns></returns>
            private static bool IsVerticalWin(int player, int n)
            {
                for (int x = 0; x < n; x++)
                {
                    int count = 0;
                    for (int y = 0; y < n; y++)
                    {
                        var key = $"({x},{y})";
                        if (Board[key] == player)
                            count++;
                    }
                    if (count == n)
                        return true;
                }
                return false;
            }
            
            /// <summary>
            /// Checks for a draw game i.e. no winner = tie game
            /// </summary>
            /// <param name="n"></param>
            /// <returns></returns>
            private static bool isDraw(int n)
            {
                for (int x = 0; x < n; x++)
                {
                    for (int y = 0; y < n; y++)
                    {
                        var key = $"({x},{y})";
                        if (Board[key] == (int)state.B)
                            return false;
                    }
                }
                return true;
            }
        }
    }
}
