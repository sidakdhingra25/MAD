import 'dart:io';

// Logger Mixin
mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

// Base Character class
class Character {
  String name;
  int health;

  Character(this.name, this.health);

  void showInfo() {
    print('Name: $name, Health: $health');
  }
}

// Warrior class
class Warrior extends Character with Logger {
  int attackDamage;

  Warrior(String name, int health, this.attackDamage) : super(name, health);

  void performAttack() {
    logInfo('$name performs a powerful attack!');
  }
}

// Mage class
class Mage extends Character with Logger {
  int spellPower;

  Mage(String name, int health, this.spellPower) : super(name, health);

  void castSpell() {
    logInfo('$name casts a powerful spell!');
  }
}

// Rogue class
class Rogue extends Character with Logger {
  int agility;

  Rogue(String name, int health, this.agility) : super(name, health);

  void performStealthAttack() {
    logInfo('$name performs a stealthy attack!');
  }
}

void main() {
  // User input
  print('Choose your character class (Warrior, Mage, Rogue):');
  String selectedClass = stdin.readLineSync() ?? '';

  // Creating a character based on user input
  Character playerCharacter;
  switch (selectedClass.toLowerCase()) {
    case 'warrior':
      playerCharacter = Warrior('WarriorName', 100, 20);
      break;
    case 'mage':
      playerCharacter = Mage('MageName', 80, 30);
      break;
    case 'rogue':
      playerCharacter = Rogue('RogueName', 90, 25);
      break;
    default:
      print('Invalid character class.');
      return;
  }

  // Performing class-specific actions
  if (playerCharacter is Warrior) {
    Warrior warrior = playerCharacter as Warrior;
    warrior.performAttack();
  } else if (playerCharacter is Mage) {
    Mage mage = playerCharacter as Mage;
    mage.castSpell();
  } else if (playerCharacter is Rogue) {
    Rogue rogue = playerCharacter as Rogue;
    rogue.performStealthAttack();
  }

  // Showing character information
  playerCharacter.showInfo();
}
