import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class gameOfLife extends PApplet {

int y = 1500;
int x = 1500;

cell[][] cells;
cell[][] oldCells;

cellRoom main;

public void setup() {
    

    cells = new cell[40][40];
    oldCells = new cell[40][40];

    main = new cellRoom();

    frameRate(10);
}

public void draw() {
    main.display();
    main.update();

}
class cell {

    private int dimension;

    private int x;
    private int y;

    private int state; // 1 = alive 0 = dead

    public cell(int x, int y, int state) {
        this.dimension = 20;
        this.x = x;
        this.y = y;
        this.state = state;
    }

    public int getState() {
        return state;
    }

    public void display() {
        int c = color(255); // White
        if(state == 1) {
            c = color(255, 204, 0); // Yellow
        }
        fill(c);
        rect(x, y, dimension, dimension);
    }

    public void update() {
        int count = neighbors();

        if(state == 1) {
            if(count < 2 || count > 3) { // Under Population Over Population
                state = 0;
            }
        } else {
            if(count == 3) { // Reproduction
                state = 1;
            }
        }

    }

    private int neighbors() {
        int indexX = x / 20;
        int indexY = y / 20;

        return  cells[indexY - 1][indexX - 1].getState() + // NW
                cells[indexY - 1][indexX].getState() + // N
                cells[indexY - 1][indexX + 1].getState()  + // NE
                cells[indexY][indexX - 1].getState() + // W
                cells[indexY][indexX + 1].getState() + // E
                cells[indexY + 1][indexX - 1].getState() + // SW
                cells[indexY + 1][indexX].getState() + // S
                cells[indexY + 1][indexX + 1].getState(); // SE

    }
}
class cellRoom {

    int[] states = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0};

    public cellRoom() {
        for(int i = 0;i < cells.length;i++) {
            for(int j = 0;j < cells[0].length;j++) {
                cells[i][j] = new cell(i * 20, j * 20, states[PApplet.parseInt(random(10))]);
            }
        }
    }

    public void display() {
        for(int i = 0;i < cells.length;i++) {
            for(int j = 0;j < cells[0].length;j++) {
                cells[i][j].display();
            }
        }
    }

    public void update() {
        for(int i = 1;i < oldCells.length - 1;i++) {
            for(int j = 1;j < oldCells[0].length - 1;j++) {
                oldCells[i][j] = cells[i][j];
                oldCells[i][j].update();
                cells[i][j] = oldCells[i][j];
            }
        }
    }
}

class room {

}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "gameOfLife" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
