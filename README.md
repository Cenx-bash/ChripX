** Others_two **

Start["START"] --> Menu{<b>MENU</b><br>1: Play from Beginning<br>2: Select Scene}
    
    Menu -->|1| PlayBeginning[Play from Beginning]
    Menu -->|2| SelectScene[Select Scene]
    
    %% Play from Beginning Path
    PlayBeginning --> AptScene[Apartment Interrogation Scene]
    
    AptScene --> AptChoice{<b>Choice</b>}
    AptChoice -->|1: LET HIM DROP| MercFalse["isMerciful = false"]
    AptChoice -->|2: PULL HIM BACK| MercTrue["isMerciful = true"]
    
    MercFalse --> CombatToxic
    MercTrue --> CombatToxic
    
    CombatToxic --> CombatChoice{<b>Choice</b><br>1: OVER SHROUD<br>2: PREPARE TO DIE<br>3: I'M HERE TO F YOU UP}
    CombatChoice --> Punishment{<b>Choice</b><br>1: PUNT<br>2: STOMP}
    
    Punishment --> StreetFight[Street Fight]
    
    StreetFight --> StreetChoice{<b>Choice</b>}
    StreetChoice -->|1: PUNCH RIGHT| SF1["didFailStreetFight = true<br>Tactical_Efficiency_Score -1<br>public_reputation -1"]
    StreetChoice -->|2: PUNCH LEFT| SF2["Tactical_Efficiency_Score +2<br>Blazer_Impression_Score +1<br>public_reputation +1"]
    
    SF1 --> BarFlambae
    SF2 --> BarFlambae
    
    BarFlambae[Bar Flambae] --> BarChoice{<b>Choice</b>}
    BarChoice -->|1: THROW WATER| BF1["Blazer_Impression_Score +3<br>public_reputation -1"]
    BarChoice -->|2: THROW ALCOHOL| BF2["Blazer_Impression_Score +3<br>public_reputation -2"]
    
    BF1 --> Billboard
    BF2 --> Billboard
    
    Billboard[Billboard Scene] --> BillboardChoice{<b>Choice</b>}
    BillboardChoice -->|1: KISS HER| BB1["isRomanticTensionActive = true<br>Blazer_Impression_Score +3"]
    BillboardChoice -->|2: LET THE MOMENT PASS| BB2["isRomanticTensionActive = false<br>Blazer_Impression_Score = 0"]
    
    BB1 --> Epilogue
    BB2 --> Epilogue
    
    Epilogue[Epilogue] --> MercDecision{isMerciful?}
    MercDecision -->|True| CompLead[Compassionate Leadership]
    MercDecision -->|False| PragEff[Pragmatic Efficiency]
    
    CompLead --> StreetDecision
    PragEff --> StreetDecision
    
    StreetDecision{didFailStreetFight?} -->|True| Mistake["Your early mistake<br>shaped your tactics."]
    StreetDecision -->|False| StrongStart["Your strong start<br>built your confidence."]
    
    Mistake --> OutcomeDecision
    StrongStart --> OutcomeDecision
    
    OutcomeDecision{Blazer_Impression_Score &<br>isRomanticTensionActive} --> Cond1[Score ≥ 4 & Romantic<br>Romance Route unlocked]
    OutcomeDecision --> Cond2[Score ≥ 3<br>Public Legend]
    OutcomeDecision --> Cond3[Else<br>Professional Respect]
    
    Cond1 --> DisplayRep[Display Public Reputation]
    Cond2 --> DisplayRep
    Cond3 --> DisplayRep
    
    DisplayRep --> End1[END]
    
    %% Select Scene Path
    SelectScene --> Scene1[Scene 1: Apartment Interrogation]
    SelectScene --> Scene2[Scene 2: Combat Toxic]
    SelectScene --> Scene3[Scene 3: Street Fight]
    SelectScene --> Scene4[Scene 4: Bar Flambae]
    SelectScene --> Scene5[Scene 5: Billboard]
    
    Scene1 --> Cont1{Continue?<br>1: Yes / 2: No}
    Cont1 -->|1: Yes| From1[Combat Toxic → Street Fight →<br>Bar Flambae → Billboard → Epilogue]
    Cont1 -->|2: No| End2[END]
    
    Scene2 --> Cont2{Continue?<br>1: Yes / 2: No}
    Cont2 -->|1: Yes| From2[Street Fight → Bar Flambae →<br>Billboard → Epilogue]
    Cont2 -->|2: No| End3[END]
    
    Scene3 --> Cont3{Continue?<br>1: Yes / 2: No}
    Cont3 -->|1: Yes| From3[Bar Flambae → Billboard → Epilogue]
    Cont3 -->|2: No| End4[END]
    
    Scene4 --> Cont4{Continue?<br>1: Yes / 2: No}
    Cont4 -->|1: Yes| From4[Billboard → Epilogue]
    Cont4 -->|2: No| End5[END]
    
    Scene5 --> Cont5{Continue?<br>1: Yes / 2: No}
    Cont5 -->|1: Yes| From5[Epilogue]
    Cont5 -->|2: No| End6[END]
    
    From1 --> End7[END]
    From2 --> End8[END]
    From3 --> End9[END]
    From4 --> End10[END]
    From5 --> End11[END]
    


