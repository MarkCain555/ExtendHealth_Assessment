using System;
using System.Linq;

namespace ExtendHealth_Assessment
{
    class Program
    {
        static void Main(string[] args)
        {
            // Number of Unique email addresses
            string[] addresses =
            {
                "first.m.last@somewhere.com",
                "firstmlast@somewhere.com",
                "team.1+bob@somewhere.com",
                "team1+jill+bob@somewhere.com",
                "team2@somewhere.com",
                "team2@some.where.com"
            };

            Console.WriteLine("The number of unique email addresses: " + Solution.NumberOfUniqueEmailAddresses(addresses));
            Console.WriteLine();
            Console.WriteLine();

            Console.WriteLine("Toc Tac Toe Game");
            // Tic Tac Toe Game
            Console.WriteLine("To start a Tic Tac Toe game, enter a POSITIVE value for n GREATER THAN 0");
            int n = Convert.ToInt32(Console.ReadLine());
            Solution.TicTacToe game = new(n);
        }
    }
}
