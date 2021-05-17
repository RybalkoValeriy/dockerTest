using System;
using NameSpace;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            User user = new User();
            user.Id = 1;
            user.Name = "Alex";
            System.Console.WriteLine(user.Id);
            System.Console.WriteLine(user.Name);
            Console.WriteLine("Hello World!");
        }
    }
}
