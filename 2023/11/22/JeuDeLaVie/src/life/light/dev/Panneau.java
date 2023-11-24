package life.light.dev;

import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;

public class Panneau extends JPanel {

    private World world;

    public void paintComponent(Graphics g){
        //On choisit une couleur de fond pour le rectangle
        g.setColor(Color.white);
        //On le dessine de sorte qu'il occupe toute la surface
        g.fillRect(0, 0, this.getWidth(), this.getHeight());
        g.setColor(Color.black);

        for (Cell cell : world.cellsAlive) {
            g.fillRect(cell.x*10, cell.y*10, 10, 10);
        }
    }

    public void setWorld(World world) {
        this.world = world;
    }
}