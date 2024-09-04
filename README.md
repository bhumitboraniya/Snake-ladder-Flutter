# Snakes and Ladders Flutter App
<img src="https://github.com/user-attachments/assets/a243c16b-684a-47d9-a23f-470bf623f2b3" alt="Description of Image" width="500" height="1000">
![WhatsApp Image 2024-09-05 at 00 11 53_52e6b81d](https://github.com/user-attachments/assets/22a9f305-b95d-41f1-8404-65dac4f739b6)
![WhatsApp Image 2024-09-05 at 00 11 51_254f7ce0](https://github.com/user-attachments/assets/436f3d76-6a7b-4411-96d4-522476ccbe4c)
![WhatsApp Image 2024-09-05 at 00 11 49_0a521a17](https://github.com/user-attachments/assets/b38ee5d9-de22-4958-93da-dd4c7d69915f)
![WhatsApp Image 2024-09-05 at 00 11 50_9e9d9235](https://github.com/user-attachments/assets/ddd966b9-9a14-45ab-9d6d-ef9556e6fe73)
![WhatsApp Image 2024-09-05 at 00 11 51_f4e7b39e](https://github.com/user-attachments/assets/11304a20-8c6d-4bdc-8d73-26fa3506fa74)



## Overview

This is a Flutter application for the classic game "Snakes and Ladders." The game includes two modes:
- **Player Mode**: Allows a player to roll the dice and move their position on the board while encountering snakes and ladders.
- **Admin Mode**: Allows an admin to manage (add, update, delete) snakes and ladders on the board.

## Features

- **Player Mode**:
  - Roll a dice to move on the board.
  - Encounter and interact with snakes and ladders.
  - View current position on the board.
  - Game finish dialog when reaching position 100.

- **Admin Mode**:
  - Add or update snakes and ladders.
  - Delete existing snakes and ladders.
  - Manage game state through a user-friendly interface.

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/snakes-and-ladders-flutter.git

```
Navigate into the project directory:
```
cd snakes-and-ladders-flutter
```
Install dependencies:
```
flutter pub get
```
Run the app:
```
flutter run
```
## lib/</br>
main.dart: Entry point of the application. </br>
AdminScreen.dart: Screen for admin mode.</br>
PlayerScreen.dart: Screen for player mode.</br>
BoardWidget.dart: Widget to display the game board.</br>
ManageSnakesLaddersScreen.dart: Screen for managing snakes and ladders.</br>
SnakesAndLaddersModel.dart: State management model for snakes and ladders.</br>


Dependencies
flutter: The Flutter SDK.
provider: State management package used for managing game state.


### Usage

## Player Mode
1. Navigate to Play as Player from the home screen.
2. Roll the dice to move your player.
3. Interact with snakes and ladders on the board.
4. Reach position 100 to finish the game.

## Admin Mode
1. Navigate to Play as Admin from the home screen.
2. Manage snakes and ladders using the provided interface.
3. Add, update, or delete snakes and ladders as needed.

## Contributing
Fork the repository.
Create a new branch for your changes.
Make your changes and test them.
Submit a pull request.
