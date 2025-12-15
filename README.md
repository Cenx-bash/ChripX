# Others_two
---

```
START (Process)
│
├─ MENU: [1] Play from Beginning / [2] Select Scene (Decision)
│
├─ If 1: Play from Beginning (Process)
│   │
│   ├─ Apartment Interrogation Scene (Process)
│   │     ├─ LET HIM DROP [1] → isMerciful = false (Process)
│   │     └─ PULL HIM BACK [2] → isMerciful = true (Process)
│   │
│   ├─ Combat Toxic (Process)
│   │     ├─ Choice: OVER SHROUD [1] / PREPARE TO DIE [2] / I’M HERE TO F YOU UP [3] (Decision)
│   │     │     └─ Each branch → PUNT [1] / STOMP [2] (Decision)
│   │
│   ├─ Street Fight (Process)
│   │     ├─ PUNCH RIGHT [1] → didFailStreetFight = true, Tactical_Efficiency_Score -1, public_reputation -1 (Process)
│   │     └─ PUNCH LEFT [2] → Tactical_Efficiency_Score +2, Blazer_Impression_Score +1, public_reputation +1 (Process)
│   │
│   ├─ Bar Flambae (Process)
│   │     ├─ THROW WATER [1] → Blazer_Impression_Score +3, public_reputation -1 (Process)
│   │     └─ THROW ALCOHOL [2] → Blazer_Impression_Score +3, public_reputation -2 (Process)
│   │
│   ├─ Billboard Scene (Process)
│   │     ├─ KISS HER [1] → isRomanticTensionActive = true, Blazer_Impression_Score +3 (Process)
│   │     └─ LET THE MOMENT PASS [2] → isRomanticTensionActive = false, Blazer_Impression_Score = 0 (Process)
│   │
│   └─ Epilogue (Process)
│         ├─ Path Decision: isMerciful? (Decision)
│         │     ├─ True → Compassionate Leadership (Process)
│         │     └─ False → Pragmatic Efficiency (Process)
│         ├─ Street Fight Result: didFailStreetFight? (Decision)
│         │     ├─ True → "Your early mistake shaped your tactics." (Process)
│         │     └─ False → "Your strong start built your confidence." (Process)
│         ├─ Outcome Decision: Blazer_Impression_Score & isRomanticTensionActive (Decision)
│         │     ├─ Score ≥ 4 & Romantic → Romance Route unlocked (Process)
│         │     ├─ Score ≥ 3 → Public Legend (Process)
│         │     └─ Else → Professional Respect (Process)
│         └─ Display Public Reputation (Process)
│
└─ If 2: Select Scene (Process)
      ├─ Scene 1: Apartment Interrogation (Process)
      │       ├─ Continue? Yes [1] / No [2] (Decision)
      │       │     └─ Yes → Combat Toxic → Street Fight → Bar Flambae → Billboard → Epilogue (Process)
      │       │     └─ No → END (Process)
      ├─ Scene 2: Combat Toxic (Process)
      │       ├─ Continue? Yes [1] / No [2] (Decision)
      │       │     └─ Yes → Street Fight → Bar Flambae → Billboard → Epilogue (Process)
      │       │     └─ No → END (Process)
      ├─ Scene 3: Street Fight (Process)
      │       ├─ Continue? Yes [1] / No [2] (Decision)
      │       │     └─ Yes → Bar Flambae → Billboard → Epilogue (Process)
      │       │     └─ No → END (Process)
      ├─ Scene 4: Bar Flambae (Process)
      │       ├─ Continue? Yes [1] / No [2] (Decision)
      │       │     └─ Yes → Billboard → Epilogue (Process)
      │       │     └─ No → END (Process)
      └─ Scene 5: Billboard (Process)
              ├─ Continue? Yes [1] / No [2] (Decision)
              │     └─ Yes → Epilogue (Process)
              │     └─ No → END (Process)
```


