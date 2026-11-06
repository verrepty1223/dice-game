using GLib;
using DiceGame.Domain;

namespace DiceGame {
    
    // functions
    public void test_core() {
        GameCore core = new GameCore();
        core.do_throw_1();
        
        stdout.printf("Welcome to dice game!!!\n\n");
        stdout.printf("first throw is: %d\n", core.throw_1);
        stdout.printf("Will next throw be [LOWER, HIGHER]: ");
        string? user_choice = stdin.read_line();

        core.do_throw_2();

        switch (user_choice.strip().up()) {
            case "LOWER":
                core.choice = GameCore.Choice.LOWER;
                break;
            case "HIGHER":
                core.choice = GameCore.Choice.HIGHER;
                break;
        }
        
        bool result = core.get_result();

        if (result) {
            stdout.printf("Right, throw_1: %d and throw_2: %d with choice: %b\n", core.throw_1, core.throw_2, core.choice);
        }
        else {
            stdout.printf("Wrong, throw_1: %d and throw_2: %d with choice: %b\n", core.throw_1, core.throw_2, core.choice);
        }
        
    }// public void test_core()

    // enterypoint
    void main() {
        test_core();
    }// void main()

}// namespace DiceGame