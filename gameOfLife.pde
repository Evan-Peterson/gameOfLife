int y = 1500;
int x = 1500;

cell[][] cells;
cell[][] oldCells;

cellRoom main;
room menu;
room currentRoom;

void setup() {
    size(800, 800);

    cells = new cell[40][40];
    oldCells = new cell[40][40];

    main = new cellRoom();
    menu = new mainMenu();
    currentRoom = menu;

    frameRate(10);
}

void draw() {
    currentRoom.display();
    currentRoom.update();

}
