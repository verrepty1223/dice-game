using GLib;
using DiceGame.Domain;

namespace DiceGame {
    
    // functions
    public void test_dice() {
        var rnd = new Dice();
        stdout.printf("throw 1: %d\n", rnd.pips);
        rnd.throw_dice();
        stdout.printf("throw 2: %d\n", rnd.pips);
    }// public void test_dice()

    // enterypoint
    void main() {
        test_dice();
    }// void main()

}// namespace DiceGame