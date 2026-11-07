using GLib;
using DiceGame.Domain;

namespace DiceGame {
    
    // functions
    public void test_controller() {
        Controller controller = new Controller();
        string border = string.nfill(60, '=');
        
        // game title
        print(border + "\n");
        print("DICE GAME\n");
        print(border + "\n\n");

        // setup
        controller.do_throw_1();

        // game loop
        while (true) {
            
            stdout.printf("First throw: %d\n", controller.throw_1);
            stdout.printf("Will next throw be [LOWER, HIGHER]: ");
            string? user_choice = stdin.read_line();

            controller.do_throw_2();

            while (true) {
                if (user_choice.strip().up() != "HIGHER" || user_choice.strip().up() !="LOWER") {
                    break;
                }
                else {
                    stdout.printf("Error, input: '%s' is not valid", user_choice);
                    stdout.printf("Will next throw be [LOWER, HIGHER]: ");
                    user_choice = stdin.read_line();
                }
                
            }// while (user_choice.strip().up() != "HIGHER" || user_choice.strip().up() !="LOWER")

            switch (user_choice.strip().up()) {
                case "LOWER":
                    controller.choice = Choice.LOWER;
                    break;
                case "HIGHER":
                    controller.choice = Choice.HIGHER;
                    break;
            }// switch (user_choice.strip().up())

            bool result_choice = controller.get_result();

            if (result_choice) {
                stdout.printf("Guess is RIGHT\n");
                stdout.printf("Throw 1: %d\n", controller.throw_1);
                stdout.printf("Throw 2: %d\n", controller.throw_2);
                stdout.printf("Guess %s\n\n", controller.choice.to_string());
            }
            else {
                stdout.printf("Guess is WRONG\n");
                stdout.printf("Throw 1: %d\n", controller.throw_1);
                stdout.printf("Throw 2: %d\n", controller.throw_2);
                stdout.printf("Guess %s\n\n", controller.choice.to_string());

                stdout.printf(border + "\n");
                stdout.printf("GAME OVER\n");
                stdout.printf(border + "\n");
                Process.exit(0);

            }// if (result_choice) 

            stdout.printf(border + "\n");
            stdout.printf("NEXT ROUND\n");
            stdout.printf(border  + "\n");
            controller.next_round();
            
        }// while (true)

    }// public void test_controller()

    // enterypoint
    void main() {
        test_controller();
    }// void main()

}// namespace DiceGame