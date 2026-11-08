using GLib;
using DiceGame.Domain;

namespace DiceGame.Interface.Cli {

    public class CommandLine : GLib.Object {

        // fields
        private Controller controller;
        private string border;
        private bool game_running;

        // controller
        public CommandLine() {
            controller = new Controller ();
            border = string.nfill (60, '=');
            game_running = true;
        }// public CommandLine()

        // methodes
        private void print_title() {
            print(border + "\n");
            print("Dice game\n");
            print(border + "\n\n");
        }// private void print_title()

        private bool process_choice(string user_choice) {

            switch (user_choice) {
                case "LOWER":
                    controller.choice = Choice.LOWER;
                    break;
                case "HIGHER":
                    controller.choice = Choice.HIGHER;
                    break;
            }// switch (user_choice)
                
            return controller.get_result();
        }// private bool process_choice(string user_choice)

        private void game_result(bool result_choice) {

            if (result_choice) {
                stdout.printf("Guess is RIGHT\n");
                stdout.printf("Throw 1: %d\n", controller.throw_1);
                stdout.printf("Throw 2: %d\n", controller.throw_2);
                stdout.printf("Guess %s\n\n", controller.choice.to_string());

                Thread.usleep(5000000);

                stdout.printf(border + "\n");
                stdout.printf("NEXT ROUND\n");
                stdout.printf(border  + "\n");
                controller.next_round();
                
                Thread.usleep(2000000);
            
            }
            else {
                stdout.printf("Guess is WRONG\n");
                stdout.printf("Throw 1: %d\n", controller.throw_1);
                stdout.printf("Throw 2: %d\n", controller.throw_2);
                stdout.printf("Guess %s\n\n", controller.choice.to_string());

                Thread.usleep(5000000);

                stdout.printf(border + "\n");
                stdout.printf("GAME OVER\n");
                stdout.printf(border + "\n");
                game_running = false;

            }// if (result_choice)

        }// private void game_result(bool result_choice) 

        public void run_game() {
            // print title
            print_title();
            // setup
            controller.do_throw_1();

            // game loop
            while (game_running) {
                
                stdout.printf("First throw: %d\n", controller.throw_1);
                stdout.printf("Will next throw be [LOWER, HIGHER]: ");
                string? user_choice = stdin.read_line().strip().up();
                controller.do_throw_2();
                
                while (user_choice != "LOWER" && user_choice != "HIGHER") {
                    stdout.printf("Will next throw be [LOWER, HIGHER]: ");
                    user_choice = stdin.read_line().strip().up();
                }// while (user_choice != "LOWER" && user_choice != "HIGHER") 

                bool result_choice = process_choice(user_choice);
                game_result(result_choice);

            }// while (game_running)

        }// public void run_game()

    }// public class CommandLine : GLib.Object

}// namespace DiceGame.Interface.Cli