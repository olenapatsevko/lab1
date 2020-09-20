
class Story {
  String storyText;
  String choice1;
  String choice2;
  String choice3;

  Story({this.storyText, this.choice1, this.choice2, this.choice3});
}

class Logic {
  int storyLevel = 0;
  List<Story> storyDb = [
    Story(storyText: "You need to graduate from university", choice1: "Do your best", choice2: "Ask your mum to help you", choice3: "Try to do this in an easy way"),
    Story(storyText: "You feel depressed, because studying takes all of your time", choice1: "Don't let you down", choice2: "Try to do this in an easy way", choice3: "Ask your mum to help you"),
    Story(storyText: "Happy graduation", choice1: "Try again", choice2: "", choice3: ""),
    Story(storyText: "You are such a lazy monkey, if you want to succeed you have to start doing smth.", choice1: "Try again", choice2: "", choice3: ""),
    Story(storyText: "Your mum loves you even without bachelor degree enjoy yourself", choice1: "Try again", choice2: "", choice3: "")
  ];

  List getStory() {
    return [
      storyDb[storyLevel].storyText,
      storyDb[storyLevel].choice1,
      storyDb[storyLevel].choice2,
      storyDb[storyLevel].choice3
    ];
  }

  void nextStory(int choice) {
    if (choice == 1 && storyLevel == 0) {
      storyLevel = 1;
    } else if (choice == 2 && storyLevel == 0) {
      storyLevel = 4;
    } else if (choice == 3 && storyLevel == 0) {
      storyLevel = 2;
    } else if (choice == 1 && storyLevel == 1) {
      storyLevel = 2;
    } else if (choice == 2 && storyLevel == 1) {
      storyLevel = 3;
    } else if (choice == 3 && storyLevel == 1) {
      storyLevel = 4;
    }else if(storyLevel>=2){
      restartGame();
    }
  }
  void restartGame() {
    storyLevel = 0;
  }
   bool isVisible(){
    if(storyLevel>=2){
      return true;
    }
    return false;
   }
}
