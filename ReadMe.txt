July 30, 2024
1st update
 
So if you look to the left, the side pane you'd see the main code structure, it's not organized yet but lets take things little by little.
So note these: 
1. The lib folder is the parent folder for all things code and development.
2. The first folder under lib is where the login page and signup pages are.
3.Then the main screen pages are the pages that after all the loading, would be displayed to the user, basically the body of the entire thing.
4.We have the onboarding page which is the first page after the splash screen that the user sees and interact with.
5.The profile page which you created for the profile page.
6.Then the widgets folder which we use for our custom widgets that are separate from the in built widgets, we have two as of now.
7. We have three standalone dart files here, first our constants.dart which we store data and code that would be constant like color and object declaration, the main.dart file where code execution starts and we would rarely touch that for now at least, the our splash screen page.

8. Another important folder to take note of is the Assets folder which has two children in it, Images and Icons respectively, images are to be in png format, while Icons are to be in svg format.
9.Then we have the font folder where we have all our fonts.
Note when a font, icon or image is added you have to navigate to your pubspec.yaml file and add it as a dependency.