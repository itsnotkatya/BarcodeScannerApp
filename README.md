#### Barcode scanning app

This app was developed for the engineers of the company N, who were involved in the delivery of computer equipment to enterprises. Data on each computer had to be saved in a special form and sent to the server.

My chose of development tool fell on Flutter because this is a superior framework that encourages developers of all skill levels to build apps in a way that foster the use of good design patterns and best practices, rather than being prone to standards conflicts or built-in technical debt resulting from poor language practices (such as bad JavaScript, which most developers will agree is a nightmare at best). So, for me (beginner) it was the best chose.

My app starts with first form that asks user to choose city, address, today's date and to fill two more forms with execotor's name and director's name. This form also has validation, so it won't let you go to another screen while there are empty fields.

<img src="/screenshots/firstform.png" alt="first" width="300"/>
<img src="/screenshots/firstformvalidation.png" alt="second" width="300"/>
<img src="/screenshots/firstformfilled.png" alt="third" width="300"/>


As soon as user got to the second screen, he sees another text form with validation that should be filled in.

<img src="/screenshots/secondform.png" alt="fourth" width="300"/>
<img src="/screenshots/secondformvalidation.png.png" alt="fifth" width="300"/>


When button 'Сканировать' is pressed, a scanning process begins. User will have to scan three barcodes that will automaticlly add to fields.

<img src="/screenshots/secondformsemifilled.png" alt="sixth" width="300"/>

Here are three scanning overlays:

<img src="/screenshots/firstoverlay.PNG" alt="seventh" width="300"/>
<img src="/screenshots/secondoverlay.PNG" alt="eighth" width="300"/>
<img src="/screenshots/thirdoverlay.PNG" alt="ninth" width="300"/>

This is how form looks right after scanning:

<img src="/screenshots/secondformfilled.PNG" alt="tenth" width="300"/>

After subbmittung and pressing the button 'Далее' user will get to the final form where all fields are enabled, after pressing on 'Отправить данные' button, all data is being sent to server with json file.

<img src="/screenshots/thirdform1.PNG" alt="eleventh" width="300"/>
<img src="/screenshots/thirdform2.PNG" alt="twelveth" width="300"/>

Here are the links on resourses that I used for my app:
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
[How to Build Forms with Validation](https://flutter.dev/docs/cookbook/forms/validation),
[How to Fetch Data Using API Calls](https://medium.com/@maffan/how-to-fetch-data-using-api-calls-in-flutter-99668a60170c),
[Flutter Sending Data to the Internet](https://www.geeksforgeeks.org/flutter-sending-data-to-the-internet/),
