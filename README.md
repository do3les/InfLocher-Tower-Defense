# InfLocher-Tower-Defense

Projektarbeit von dem Informatikkurs der KS2 am Gymnasium Überlingen.

Branch bestehend aus LeosBranch stand 00:5 21.09

Neue änderungen:
1. Level 1
   - BasicNode
     - Als PLatzthalter zur verlinkung von TowerSzenen
2. Tower
   - SzeneBasicTower
     - Sprites
       - TowerBasis
       - TowerHead
     - Behebung Pixelation (Für das ganze Projekt bei Problemen Bitte melden. (Pixelation eingestellt auf Pixelart also klare übergänge zwischen einzelnen Pixel. Könnte für Porbleme in normalen Bildern sorgen (Lässt sich aber dann individuell für jedes bild wieder anpassen)
   - Extends von einem neuem Towerscript zum mangen von allgemienem Tower verhalten
3. allgemeines TowerScript
   - Array für gegner (bitte nutzt für den gegner KinematicBody2D damit ich ihn erkennen kann)
   - Func für erkenne ob sich gener in range befinden
   - + bin dabei ,dass enemy tracking von genern zu implimentiren (wie bereits oben erwähnt nehmt den richtigen Collider pls)
   - + bin dabei ,dass bauen von tower zu implimentieren (mit ihren dem entsprechenden werten)
4. DatenBasisSatzt
   - zum speichern von z.B. TowerStats, GegnerStats etc.
