cell[][] cells = new cell[75][75];

cell[][] oldCells = new cell[75][75];

int[] states = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0};

void setup() {
    size(1500,1500);

    for(int i = 0;i < cells.length;i++) {
        for(int j = 0;j < cells[0].length;j++) {
            cells[i][j] = new cell(i * 20, j * 20, states[int(random(10))]);
        }
    }
    System.out.println("Test01");
    frameRate(10);
}

void draw() {
    for(int i = 0;i < cells.length;i++) {
        for(int j = 0;j < cells[0].length;j++) {
            cells[i][j].display();
        }
    }
    System.out.println("test");
    for(int i = 1;i < oldCells.length - 1;i++) {
        for(int j = 1;j < oldCells[0].length - 1;j++) {
            oldCells[i][j] = cells[i][j];
            System.out.println("Test");
            cells[i][j] = oldCells[i][j].update();
        }
    }
}
