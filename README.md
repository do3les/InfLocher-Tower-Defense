# InfLocher-Tower-Defense

Projektarbeit von dem Informatikkurs der KS2 am Gymnasium Überlingen.

Branch bestehend aus LeosBranch stand 00:5 21.09
Neue änderungen:

1. Level 1
  -BasicNode
   -AlsPLatzt Halter zur verlinkung von TowerSzenen
1. Tower
  -SzeneBasicTower
   -Sprites
    -TowerBasis
    -TowerHead
  -BasicTowerScript 
   -Extends von einem neuem Towerscript zum mangen von allgemienem Tower verhalten
  -allgemeines TowerScript
   - Array für gegner (bitte nutzt für den gegner KinematicBody2D damit ich ihn erkennen kann)
   - Func für erkenne ob sich gener in range befinden
   - + bin dabei ,dass enemy tracking von genern zu implimentiren (wie bereits oben erwähnt nehmt den richtigen Collider pls)
   - + bin dabei ,dass bauen von tower zu implimentieren (mit ihren dem entsprechenden werten)
1. DatenBasisSatzt
  -zum speichern von z.B. TowerStats, GegnerStats etc.
