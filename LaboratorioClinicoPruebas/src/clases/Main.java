package clases;

import interfaces.Login;
import javax.swing.JFrame;

public class Main {
    public static void main(String[] args) {
        Login lobbyFrame = new Login();

        lobbyFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        lobbyFrame.setVisible(true);
    }
}
