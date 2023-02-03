void mousePressed() { //if clicking on mouse then 

  if (screen == 0) { 

    if (Start.clicking()) {  //start button
      screen = 1;
    }
    if (Exit.clicking()) { //exit button
      exit();
    }
  }
  if (screen == 3) {
    if (retry1.clicking()) { //retry button (win screen)
      reset();
    }
  }
  if (screen == 4) {
    if (retry1.clicking()) {  //retry button (lose screen)
      reset();
    }
  }
}
