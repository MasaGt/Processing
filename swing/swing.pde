import javax.swing.*;
import processing.awt.PSurfaceAWT;
import java.awt.event.*;

String[] sounds;
String currentSound;
void setup() {
  size(500, 500, P2D);
  setList();
  currentSound = (String)JOptionPane.showInputDialog(
                   null, //frame
                   "Select Drum Sound", //content
                   "Select Drum Sound", //dialog title
                   JOptionPane.PLAIN_MESSAGE, //message type
                   null, //icon
                   sounds,
                   sounds[0]
                   );
  
  
}

void setList() {
  sounds = new String[7];
  sounds[0] = "Bass";
  sounds[1] = "Crash";
  sounds[2] = "HighTom";
  sounds[3] = "MidTom";
  sounds[4] = "FloorTom";
  sounds[5] = "HiHat";
  sounds[6] = "RideCymbal";
}
