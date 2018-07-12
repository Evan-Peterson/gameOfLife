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

        //boolean rando = false;
        /*
        if(state == 1 && count == 0) {
            System.out.println("Cell " + x / 20 + y / 20);
            System.out.println("State: " + state);
            System.out.println("Count: " + count);
            rando = true;
        }
        */
        if(state == 1) {
            if(count < 2 || count > 3) { // Under Population Over Population
                state = 0;
            }
        } else {
            if(count == 3) { // Reproduction
                state = 1;
            }
        }
        /*
        if(rando) {
            System.out.println("Update: " + state);
        }
        */
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
