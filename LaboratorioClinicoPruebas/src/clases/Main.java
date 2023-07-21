package clases;

import interfaces.lobby;
import javax.swing.JFrame;

public class Main {
    public static void main(String[] args) {
        lobby lobbyFrame = new lobby();

        lobbyFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        lobbyFrame.setVisible(true);
    }
}
