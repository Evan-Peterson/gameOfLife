class mainMenu extends room {

    public mainMenu() {
        background(51);
    }

    public void display() {

    }

    public void update() {
        if(keyPressed) {
            if(key == 'b') {
                currentRoom = main;
            }
        }
    }
}
