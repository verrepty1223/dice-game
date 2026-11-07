using GLib;

namespace DiceGame.Domain {
    
    public class Controller : GLib.Object {

        // fields
        private GameCore game_core;
        
        // properties
        public int throw_1 {
            get {return game_core.throw_1;}
        }

        public int throw_2 {
            get {return game_core.throw_2;}
        }

        public Choice choice {
            get {return game_core.choice;}
            set {game_core.choice = value;}
        }

        // functions
        public void do_throw_1() {
            game_core.do_throw_1();
        }

        public void do_throw_2() {
            game_core.do_throw_2();
        }

        public bool get_result() {
            return game_core.get_result();
        }

        public void next_round() {
            game_core.next_round();
        }

        // controller
        public Controller() {
            game_core = new GameCore();

        }// public Controller()

    }// public class Controller : GLib.Object

} // namespace DiceGame.Domain