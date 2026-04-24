---
layout: post
author: zcool
title:  "Paramétrages CNC FoxAlien 4040-XE"
categories: [CAO, CNC]
math: true
---

Ce post rassemble le paramétrage que j'utilise avec ma CNC FoxAlien 4040-XE et ses différents outils.

> Disclaimer : Les différents paramétrages de cette page fonctionne sur ma CNC, mais ce paramétrage sera
> nécessairement différents sur d'autres CNC. Les valeurs indiquées ne sont donc qu'à titre informatif.
{: .prompt-warning }

## Caractéristiques techniques de la FoxAlien 4040-XE

Spécifications:
- Model: 4040-XE
- Active Working Area: 15.75 x 15.75 x 2.56 inch (400 * 400 * 65mm)
- Spindle Power: 300W
- Stepper Motor: NEMA 23
- Accuracy: 0.1mm
- Maximum Moving Speed: 2000mm/min
- Maximum Moving Speed (Z axis): 1200mm/min
- Input Voltage: 110V/220V
- Input Current: 110V/10A; 220V/5A
- Control Method: Computer & Controller
- Support Software: Compatible with Grbl-control software
- Support OS: Windows XP/7/8/10, Linux, Mac OS
- Machine Size: 29.92 x 24.4 x 14.17 inch (760 * 620 * 360mm)


## Calcul théorique de la vitesse d'avance

La formule de base :

$$\begin{aligned}
  V_{f} = N \times F_{z} \times Z
  \end{aligned}$$

Avec les éléments suivants :
- $N$ = vitesse de rotation (tr/min)
- $F_{z}$ = avance par dent (mm/dent)
- $Z$ = nombre de dents

Pour ma CNC $N$ vaut $10000 rpm$.

Pour une fraise FC1D317 :
- $F_{z}$ = pour le MDF avec une fraise 1 dent : 0,04 à 0,06 mm/dent
- $Z$ = 1

Donc dans cet exemple, $V_{f} = 10000 \times 0,05 \times 1 = 500 mm/min$

Une plage d'avance raisonnable dans du MDF avec une fraise FC1D317 se situe donc entre 400 et 600 mm/min.


## Fraise FC1D317

Site : [FC1D317](https://www.cncfraises.fr/fraises-carbures-1-dent/79-fc1d317.html){:target="_blank"}

Données générales :
- Type : Carbure
- Nombre de dents : 1
- Matériaux :
    - MDF, CTP, Bois tendre
    - PVC expansé, matière à graver
    - Matériaux tendres

Paramétrage pour FreeCad :
- Toolbit shape : Endmil
- Spindle direction : Forward
- Material : Carbide
- Cutting edge height : 12 mm
- Diameter : 3,175 mm
- Flutes : 1
- Length : 38 mm
- Shank diameter : 3,175 mm
- Chipload : 0,05 mm (MDF)

Chipload en fonction de la matière à travailler :

| Matière                | Chipload
|------------------------|---------
| MDF / médium           | 0,04 – 0,06 mm/dent
| Bois tendre, CTP       | 0,05 – 0,08 mm/dent
| Plexi / PVC / Forex    | 0,03 – 0,05 mm/dent

Paramètre des jobs dans FreeCad pour du MDF :

| Matériau               | Vitesse de rotation | Vitesse d'avance | Vitesse de plongée | Profondeur de passe
|------------------------|---------------------|------------------|--------------------|--------------------
| MDF / médium           | 10 000 rpm          | 500 mm/min       | 200-250 mm/min     | 1,5 mm par passe (max pour éviter les vibrations et les déflexions)


> Le MDF génère des poussières très fines et nocives. Donc l'aspirateur est obligatoire, ainsi que le port d'un masque FFP2.
{: .prompt-warning }

> Pour percer un trou de 4mm de diamètre avec cette fraise, il faut utiliser une opération "Helix" avec un extra offset de -0,2mm pour compenser les flexions de la CNC.
{: .prompt-info }

## Fraise FC1DA4017DLC

Site : [FC1DA4017DLC](https://www.cncfraises.fr/fraises-1-dent-dlc-carbure-alu-pmma-queue-4-mm/383-fraise-1-dent-dlc-carbure-diametre-de-coupe-4-mm-longueur-utile-17-mm-queue-4-mm.html){:target="_blank"}

Données générales :
- Type : DLC ("Diamond-Like Carbon")
- Nombre de dents : 1
- Matériaux :
    - Aluminium
    - Composite aluminium (dibond, ...)
    - PMMA (plexiglass), PC, POM, PEHD, ...

Paramétrage pour FreeCad :
- Toolbit shape : Endmil
- Spindle direction : Forward
- Material : Carbide
- Cutting edge height : 17 mm
- Diameter : 4 mm
- Flutes : 1
- Length : 45 mm
- Shank diameter : 4 mm
- Chipload : 0,048 mm (PMMA / Thermoplastiques / PC)

Chipload en fonction de la matière à travailler :

| Matière                | Chipload
|------------------------|---------
| PMMA                   | 0,048 mm/dent

Paramètre des jobs dans FreeCad pour du MDF :

| Matériau               | Vitesse de rotation | Vitesse d'avance | Vitesse de plongée | Profondeur de passe
|------------------------|---------------------|------------------|--------------------|--------------------
| Thermoplastiques       | 10 000 rpm          | 480 mm/min       | 150 mm/min         | 1,5 mm (2 passes pour 3mm)

