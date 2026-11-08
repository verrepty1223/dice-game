using GLib;
using DiceGame.Interface.Cli;

namespace DiceGame {
    
    // enterypoint
    void main() {
        CommandLine cli = new CommandLine();
        cli.run_game();
    }// void main()

}// namespace DiceGame