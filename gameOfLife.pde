int y = 1500;
int x = 1500;

cell[][] cells = new cell[40][40];

cell[][] oldCells = new cell[40][40];

int[] states = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0};

void setup() {
    size(800, 800);

    for(int i = 0;i < cells.length;i++) {
        for(int j = 0;j < cells[0].length;j++) {
            cells[i][j] = new cell(i * 20, j * 20, states[int(random(10))]);
        }
    }

    frameRate(10);
}

void draw() {
    for(int i = 0;i < cells.length;i++) {
        for(int j = 0;j < cells[0].length;j++) {
            cells[i][j].display();
        }
    }

    for(int i = 1;i < oldCells.length - 1;i++) {
        for(int j = 1;j < oldCells[0].length - 1;j++) {
            oldCells[i][j] = cells[i][j];
            oldCells[i][j].update();
            cells[i][j] = oldCells[i][j];
        }
    }
}
