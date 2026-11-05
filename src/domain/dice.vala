using GLib;

namespace DiceGame.Domain {

    internal class Dice : GLib.Object {

        // property
        public int pips {get; private set;}

        // controller
        public Dice() {
            throw_dice();
        }// public Dice()

        // methode
        public void throw_dice() {
            pips = Random.int_range(1, 7);
        }// public void throw_dice()

    }// public class Dice : GLib.Object

}// namespace DiceGame.Domain