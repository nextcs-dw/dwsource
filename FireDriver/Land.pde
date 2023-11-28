class Land {

  int size;
  int state;
  int nextState;
  int x;
  int y;

  Land(int _x, int _y, int sz, int st) {
    x = _x;
    y = _y;
    size = sz;
    state = st;
  }//constructor

  void display() {
    if (state == DIRT) {
      fill(DIRT_COLOR);
    }
    else if (state == FIRE) {
      fill(FIRE_COLOR);
    }
    else if (state == BURNT) {
      fill(BURNT_COLOR);
    }
    else if (state == GRASS) {
      fill(GRASS_COLOR);
    }
    square(x, y, size);
  }//display

  void updateNextState(int neighborState) {
    if (state == FIRE) {
      nextState = BURNT;
    }
    else if (state == GRASS && neighborState  == FIRE) {
      nextState = FIRE;
    }
    else {
      nextState = state;
    }
  }//updateState

  void changeState() {
    state = nextState;
  }//changeState

}//Land class
