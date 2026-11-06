using GLib;
using DiceGame.Domain;

namespace DiceGame.Domain {

    internal class GameCore : GLib.Object {
        
        // enum
        public enum Choice {
            HIGHER,
            LOWER
        }

        // properties
        public int throw_1 {get; private set ; default = 0;}
        public int throw_2 {get; private set; default = 0;}
        public Choice choice {get; set; default = Choice.LOWER;}
        private Dice dice;

        // constructor
        public GameCore() {
            dice = new Dice();
            //do_roll(); // could be removed if we want the first roll to be manual
        }// public GameCore() 

        // methode
        public void do_throw_1() {
            dice.throw_dice();
            throw_1 = dice.pips;
        }// public void do_throw_1()

        public void do_throw_2() {
            dice.throw_dice();
            throw_2 = dice.pips;
        }// public void do_throw_2()

        public bool get_result() {
            bool result = false;

            if (throw_1 == 0 || throw_2 == 0) {
               result = false; 
            }

            if (throw_1 < throw_2 && choice == Choice.HIGHER) {
                result = true;
            }

            if (throw_2 < throw_1 && choice == Choice.LOWER) {
                result = true;
            }

            if (throw_1 == throw_2) {
                result = false;
            }

            return result;
        }// public bool get_result() 

        public void next_round() {
            throw_1 = throw_2;
            throw_2 = 0;
        }// public void next_round()

    }// public class GameCore : GLib.Object 

}// namespace DiceGame.Domain