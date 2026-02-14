import 'dart:math';

// ==========================
// 📊 PLAYER PROGRESS MODEL
// ==========================
class PlayerProgress {
  double currentBalance;
  int clickLevel;

  PlayerProgress({
    this.currentBalance = 0,
    this.clickLevel = 1,
  });

  // Calculate earnings per click based on level
  double get clickValue {
    // Level 1: $1
    // Level 2: $5
    // Level 3: $20
    // Formula approximation or explicit tiers?
    // Let's use a simple multiplier logic as requested:
    // "Level 1: $1, Level 2: $5, Level 3: $20" -> roughly 4x-5x growth?
    // Let's stick to a formula: Base * (Multiplier ^ (Level - 1))
    // Or just custom tiers as exampled.
    // Given request: "Level 1: $1, Level 2: $5, Level 3: $20"
    if (clickLevel == 1) return 1;
    if (clickLevel == 2) return 5;
    if (clickLevel == 3) return 20;
    
    // For levels beyond 3, let's assume a multiplier of 4x per level
    return 20 * pow(4.0, clickLevel - 3).toDouble();
  }

  // Calculate upgrade cost
  double get upgradeCost {
    // "Upgrade costs rise exponentially (e.g., $50 -> $700 -> $6,000)"
    if (clickLevel == 1) return 50;
    if (clickLevel == 2) return 700;
    if (clickLevel == 3) return 6000;

    // Exponential growth for further levels
    return 6000 * pow(8.5, clickLevel - 3).toDouble(); 
  }

  bool get canUpgrade => currentBalance >= upgradeCost;

  double get progressToNextUpgrade {
    if (upgradeCost == 0) return 1.0;
    return (currentBalance / upgradeCost).clamp(0.0, 1.0);
  }

  void click() {
    currentBalance += clickValue;
  }

  void upgrade() {
    if (canUpgrade) {
      currentBalance -= upgradeCost;
      clickLevel++;
    }
  }
}
