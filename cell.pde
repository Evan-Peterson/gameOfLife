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
        color c = color(255); // White
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

        return  oldCells[indexY - 1][indexX - 1].getState() + // NW
                oldCells[indexY - 1][indexX].getState() + // N
                oldCells[indexY - 1][indexX + 1].getState()  + // NE
                oldCells[indexY][indexX - 1].getState() + // W
                oldCells[indexY][indexX + 1].getState() + // E
                oldCells[indexY + 1][indexX - 1].getState() + // SW
                oldCells[indexY + 1][indexX].getState() + // S
                oldCells[indexY + 1][indexX + 1].getState(); // SE

    }
}
