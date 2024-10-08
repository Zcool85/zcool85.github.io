---
title:  "Hub vidéo pour mes anciennes consoles"
type: Consoles
last_modified_at: 2023-12-20 21:55:00 +0100
state: En cours
---

Je dispose de plusieurs vielles consoles (PS1, PS2, NES, SNES, GameCube, Wii, etc.). Ces dernières
disposent de connectiques vidéos disparates (CVBS, SCART, RVB, YUV, etc.). De plus, les télés "modernes"
ne disposent plus de connectiques compatibles (sans parler de devoir débrancher/rebrancher chaque
console pour pouvoir jouer).

J'aimerais donc, dans la mesure de mes capacités, trouver un moyen de pouvoir brancher toutes mes
consoles (y.c. les plus vielles) sur un boitier unique qui sera connecté à la télé sur une prise HDMI.

<!--more-->

> Alors oui je sais qu'il existe des boitiers déjà tout prêt pour convertir différents formats vidéos vers
> du hdmi, mais la plupart du temps je suis déçu de la qualité médiocre de ces produits, et il n'en reste
> pas moins qu'il faut toujours jongler avec tout un tas de convertisseurs et que si je ne veux pas passer
> mon temps à débrancher/rebrancher mes consoles, alors il me faudrait une télé avec beaucoup d'entrées vidéo.
{: .prompt-info }

Et puis... J'ai envi d'apprendre :grin:

## Mes consoles

Dans l'idéal, j'aimerais pouvoir brancher toutes ces consoles :
- Master system II (avec sortie RGB améliorée)
- NES (avec sortie CVBS)
- SNES
- GameCube
- Wii (Avec sortie YUV)
- PS1
- PS2 (Avec sortie YUV ?)
- PS3
- Dreamcast

## Formats vidéo des consoles

**TODO**
Cf. [optimal timing for OSSC](https://junkerhq.net/xrgb/index.php?title=Optimal_timings){:target="_blank"}

Pour la NES/SNES, prévoir un dejitter. Infos [ici](https://shmups.system11.org/viewtopic.php?f=6&t=61285){:target="_blank"} et projet [ici](https://github.com/marqs85/snes_dejitter){:target="_blank"}.

## Pinout cables

### Pinout SCART

La prise péritel[^scart_pinout] permet de véhiculer l'audio stéréo ainsi que plusieurs formats vidéos :
- RGB
- Compisite (CVBS[^cvbs])
- S-Video (Y/C[^svideo])

![SCART female connector pinout](/assets/scart/scartf.gif)
_Pinout prise péritel femelle_

![SCART female connector visual](/assets/scart/thumb_scartf.jpg)
_Visuel prise péritel femelle_

| Pin | Name    | Direction | Description             | Signal Level | Impédance
|----:|---------|-----------|-------------------------|--------------|----------
| 1   | AOR     | OUT       | Audio right             | 0.5 V rms    | < 1K ohm
| 2   | AIR     | IN        | Audio right             | 0.5 V rms    | > 10K ohm
| 3   | AOL     | OUT       | Audio left (+ mono)     | 0.5 V rms    | < 1K ohm
| 4   | AGND    | GND       | Audio ground            |              |
| 5   | B GND   | GND       | Blue ground (RGB)       |              |
| 6   | AIL     | IN        | Audio left (+ mono)     | 0.5 V rms    | > 10K ohm
| 7   | B       | IN        | Blue (RGB)              | 0.7 V        | 75 ohm
| 8   | SWTCH   | IN        | Slow switch (Video format) |              |
| 9   | G GND   | GND       | Green ground (RGB)      |              |
| 10  | CLKOUT  | OUT       | Data 2: Clockpulse, used in the 80s by <br />old videotapes |              |
| 11  | G       | IN        | Green (RGB)             | 0.7 V        | 75 ohm
| 12  | DATA    | OUT       | Data 1: Data            |              |
| 13  | R GND   | GND       | Red ground (RGB)        |              |
| 14  | DATAGND | GND       | Data Ground, remote control, wired and used <br />by old videotape recorders |              |
| 15  | R       | IN        | Red (RGB) / Chrominance | RGB: 0.7 V <br />Chrom.: 0.3 V burst | 75 ohm
| 16  | BLNK    | IN        | Fast blanking / Fast switch | 1~3 V => RGB<br />0~0.4 V => Composite | 75 ohm
| 17  | VGND    | GND       | Composite Video Ground or S-video luminance Ground |              |
| 18  | BLNGND  | GND       | Blanking Signal Ground - ground for slow or <br />fast switch (ground for pin 8 or 16) |              |
| 19  | VOUT    | OUT       | Composite Video         | 1 V         | 75 ohm
| 20  | VIN     | IN        | Composite Video / Luminance / RGB Sync | 1 V         | 75 ohm
| 21  | SHIELD  | GND       | Ground/Shield (Chassis) |               |

> SWTCH (Pin 8) permet de changer le mode de vidéo
> - 0~2 V => Pas de signal
> - 4.5~7 V (nominal 6V) => foramt 16:9
> - 9.5~12 V (nominal 12V) => foramt 4:3
>
> Sur certaines TV, une tension appliquée sur cette broche permet de basculer sur la chaine AUX.
{: .prompt-info }

> BLNK (Pin 16) permet d'indiquer le signal vidéo utilisé
> - 0~0.4 V => Composite
> - 1~3 V (nominal 1V) => RGB only
>
> Sur certaines TV, une tension appliquée sur cette broche permet de basculer sur la chaine AUX.
>
> The original specification defined pin 16 as fast blanking, a high frequency (up to 3MHz) signal
> that blanked the composite video. The RGB inputs were always active and the fast blanking signal
> punches holes in the composite video. The SCART connector uses this to overlay subtitles from an
> external Teletext decoder. 0V-0.4V means composite with a transparent RGB overlay. 1V-3V (nominal
> 1V) RGB only.
{: .prompt-info }

> Il n'existe pas de signal permettant d'indiquer un signal S-Video. Certaines télé peuvent
> détecter automatiquement ce signal, mais généralement il faut sélectionner ce signal
> manuellement sur la TV.
{: .prompt-warning }

### Pinout S-Video

La prise mini DIN 4[^svideo_pinout] permet de véhiculer le signal vidéo S-Video.

![S-Video female connector pinout](/assets/vga/DE15_Connector_Pinout.svg.png)
_Pinout prise S-Video femelle_

![S-Video female connector visual](/assets/vga/220px-SVGA_port.jpg)
_Visuel prise S-Video femelle_

| Pin | Name      | Direction | Description             | Signal Level | Impédance
|----:|-----------|-----------|-------------------------|--------------|----------
| 1   | GND_Y     | GND       | Luminance Ground        |              |
| 2   | GND_C     | GND       | Chrominance Ground      |              |
| 3   | Y         | OUT       | Luminance (Y)           | ?            | 75 ohm
| 4   | C         | OUT       | Chrominance (C)         | ?            | 75 ohm


### Pinout VGA

La prise vga[^vga_pinout] permet de véhiculer le signal vidéo RGB.

![VGA female connector pinout](/assets/vga/DE15_Connector_Pinout.svg.png)
_Pinout prise VGA femelle_

![VGA female connector visual](/assets/vga/220px-SVGA_port.jpg)
_Visuel prise VGA femelle_

| Pin | Name      | Direction | Description             | Signal Level | Impédance
|----:|-----------|-----------|-------------------------|--------------|----------
| 1   | RED       | OUT       | Red (RGB)               | ?            | ?
| 2   | GREEN     | OUT       | Green (RGB)             | ?            | ?
| 3   | BLUE      | OUT       | Blue (RGB)              | ?            | ?
| 4   | N/C       | -         | -                       |              |
| 5   | HSGND     | GND       | HSync Ground            |              |
| 6   | RED_RTN   | ?         | Red return              | ?            | ?
| 7   | GREEN_RTN | ?         | Green return            | ?            | ?
| 8   | BLUE_RTN  | ?         | Blue return             | ?            | ?
| 9   | +5V       | OUT       | +5V (DDC[^ddc])         | +5V          |
| 10  | GND       | GND       | DDC[^ddc] Ground + VSync Ground |              |
| 11  | N/C       | -         | -                       |              |
| 12  | SDA       | OUT       | I2C Data (DDC[^ddc])    | ?            | ?
| 13  | HSYNC     | OUT       | Horizontal Sync         | ?            | ?
| 14  | VSYNC     | OUT       | Vertical Sync           | ?            | ?
| 15  | SCL       | OUT       | I2C Clock (DDC[^ddc])   | ?            | ?

> Avant l'usage du DDC, le standard VGA utilise 4 broches pour déterminer la définition
> de l'écran :
>
> | ID2 (pin 4) | ID0 (pin 11) | ID1 (pin 12) | Monitor type
> |-------------|--------------|--------------|---------------------
> | N/C         | N/C          | N/C          | No monitor connected
> | N/C         | N/C          | GND          | < 1024x768, monochrome
> | N/C         | GND          | N/C          | < 1024x768, color
> | GND         | GND          | N/C          | >= 1024x768, color
>
{: .prompt-info }

> Le DDC[^ddc] existe à trois niveaux : DDC1, DDC2B et DDC2AB (le AB correspond à
> Access Bus). La version actuelle du DDC, appelée DDC2B, est basée sur le bus
> I²C (Inter Integrated Circuit). C'est un bus série qui autorise plusieurs maîtres
> de bus, même si le DDC2B n'en autorise qu'un seul — l'émetteur du flux. L'écran
> contient une puce à lecture seule (ROM), programmée par le fabricant, qui contient
> les informations sur les capacités d'affichage de l'écran. Le DDC1 est un lien
> unidirectionnel, allant de l'écran vers la carte graphique. Une identification
> EDID (Extended Display Identification) contenant les paramètres de l'écran est
> transmise à la carte graphique. La version DDC2AB, conçue par Philips et Digital
> avant l'arrivée de l'USB, n'a pas été retenue par les constructeurs. Elle devait
> permettre de brancher des périphériques pour le PC, sur l'écran et d'utiliser
> seulement le câble du moniteur. Les constructeurs ont préféré intégrer un hub
> USB sur les écrans.
>
> Cf. [DDC infos](https://en.wikipedia.org/wiki/Display_Data_Channel){:target="_blank"}
{: .prompt-info }

## Adaptateurs

### Adaptateur SCART / S-Video

Le montage suivant permet de créer un adaptateur SCART vers/depuis un signal S-Video/composite :

![SCART to S-Video adapter](/assets/scart/SCART_-_S-Video_Adapter.svg)

### Adapteur SCART vers VGA

**TODO** : Etudier et reprendre le schéma [ici](https://old.pinouts.ru/Audio-Video-Hardware/scart2vga_scheme_pinout.shtml){:target="_blank"}.

### Adapteur VGA vers SCART

**TODO** : Etudier et reprendre le schéma [ici](https://old.pinouts.ru/Audio-Video-Hardware/vga2scart_scheme_pinout.shtml){:target="_blank"}.

## Pinout des consoles

Toutes les consoles n'utilisent pas toutes les capacités / formats possibles d'une péritel.

L'objectif ici est de présenter le brochage utilisé par chaque console et indiquer le format
de sortie réel.

> Une liste assez complète de pleins de schéma de consoles en tout genre : [gamex](https://gamesx.com/wiki/doku.php?id=schematics:console_related_schematics){:target="_blank"}
{: .prompt-info }

Récap' :

| Console          | CVBS | RVB
|------------------|------|------
| Master system II | Yes  | Yes
| NES              | Yes  | Yes
| SNES             | Yes  | Yes
| GameCube         | Yes  | Yes
| Wii              | Yes  | Yes
| PS1              | Yes  | Yes
| PS2              | Yes  | Yes
| PS3              | Yes  | Yes
| Dreamcast        | Yes  | Yes

> A regarder pour tout sortir en VGA : [jeffqchen](https://github.com/jeffqchen/Console-VGA-Dongle-Series/tree/main){:target="_blank"}
{: .prompt-info }

### Master system II

> Le pinout de la master system II est identique au pinout de la master system
{: .prompt-info }

**TODO**
![Master system II Pinout](/assets/consoles_pinout/mastersystem.png)

> Le site de [Sylesis](http://www.sylesis.fr/inside-ms1/index.php){:target="_blank"} précise que :
> - Pin 3 : Blanck
> - Pin 7 : Synchro
>
> ... A creuser !
{: .prompt-warning }

> A creuser aussi : [RGB Booster](https://master-system.forumactif.org/t4286-rgb-booster-pour-mark-iii){:target="_blank"}
{: .prompt-tip }

### NES

**TODO**
![NES Pinout](/assets/consoles_pinout/nes.gif)

### SNES

**TODO**
![SNES Pinout](/assets/consoles_pinout/snespal.png)

### GameCube

### Wii

**TODO**
![Wii Pinout](/assets/consoles_pinout/wii.png)

### PS1

La plupart des cables PS1 utilisent le composite alors que la console sort nativement du RGB.

**TODO**
![PS1 Pinout](/assets/consoles_pinout/ps1-ps2.png)

### PS2

La PS2 utilise exactement la même connectique que la PS1.

### PS3

### Dreamcast




**TODO**

## Moding des consoles

**TODO**

Tester un RGB ampifier pour la NES ? [Lien](https://gamesx.com/wiki/doku.php?id=av:nes_rgb_amplifier){:target="_blank"}

## Les différents formats vidéos

### HDMI et compatibilité DVI

Source [Wikipedia](https://fr.wikipedia.org/wiki/High-Definition_Multimedia_Interface) :

Le HDMI Type A est rétro-compatible avec le DVI Single-link (DVI-D, DVI-I mais pas DVI-A), lequel est largement utilisé
pour les moniteurs informatiques et les cartes graphiques d'ordinateurs. Ainsi, avec un simple adaptateur, tout appareil
source qui exploite la norme DVI-D est quasi compatible avec un écran à ce standard et vice versa ; cependant, les données
audio ne seront pas toujours transmises (norme TMDS, audio pendant le blanking) mais la connectique le permet et
certains produits (cartes graphiques haut de gamme, démodulateurs satellites...) l'exploitent.
En revanche, les données de contrôle à distance (broche CEC) propres au HDMI ne pourront être utilisées puisqu'elles
n'existent pas pour la connectique DVI.
Sur le même principe, le HDMI Type B est rétro-compatible avec la connectique DVI Dual-link.

Largeur de bande pour le flux vidéo numérique : de 25 MHz à 340 MHz (Type A, norme 1.3) et jusqu'à 680 MHz (Type B).
Les formats vidéo qui exploitent une bande passante inférieure à 25 MHz (exemple : 13,5 MHz pour 480i/NTSC) sont transmis
en utilisant un schéma de répétition des pixels.

__HDMI 1.0__
Spécification initiale, publié le 9 décembre 20029
Une seule interface de connexion pour la transmission audio et vidéo ;
Une bande passante de type TMDS de 4,9 Gbit/s maximum
Spécification Vidéo basée sur DVI 1.0. 480i/p, 576i/p, 720p, 1080i.
Audio : Dolby Digital, DD EX, DTS, DTS ES, DTS 96/24, PCM 192/24 7.1 canaux.

EDID EEPROM : https://ww1.microchip.com/downloads/en/DeviceDoc/21682E.pdf
Explication EDID pour VGA et HDMI : https://ez.analog.com/cfs-file/__key/communityserver-wikis-components-files/00-00-00-01-10/1351.ADV784x_5F00_EDID_5F00_overview.pdf
EDID structure : https://glenwing.github.io/docs/VESA-EEDID-A2.pdf

l'EDID sert à fournir les specs de l'écran au périphérique. Pas sur que celà me soit nécessaire pour mon projet.

4 HDMI/DVI multiplexer to 1 output HDMI/DVI : https://www.analog.com/media/en/technical-documentation/data-sheets/adv3002.pdf


Piste pour améliorer la qualité d'un signal RVB : https://www.analog.com/en/resources/reference-designs/circuits-from-the-lab/cn0275.html#rd-functionbenefits


**TODO**

## Première réflexions de circuits

**TODO**
Cf. [Analog divice article](https://www.analog.com/en/analog-dialogue/articles/hdmi-made-easy.html){:target="_blank"}

### Colorimétrie de la NES

Pour la NES, il ne sera pas possible de connaitre la liste de toutes les couleurs rendues
par la console. En effet, la colorimétrie n'est pas fiable même produite par le hardware de
la console. Le rendu sera différent en fonction de la console et de la télé.

L'article de [RetroRGB](https://www.retrorgb.com/nes-palette-comparisons.html){:target="_blank"}
explique en détail ces nuances.

Inutile donc d'envisager de détecter les couleurs parmis une liste prédéfinie pour se simplifier
la vie...


[^scart_pinout]: Cf. [Pinoutguide - SCART](https://pinoutguide.com/Audio-Video-Hardware/Scart_pinout.shtml){:target="_blank"}
[^vga_pinout]: Cf. [Wikipedia - VGA](https://fr.wikipedia.org/wiki/Connecteur_VGA){:target="_blank"}
[^cvbs]: Cf. [Wikipedia - CVBS](https://fr.wikipedia.org/wiki/Vidéo_composite){:target="_blank"}
[^svideo]: Cf. [Wikipedia - S-video](https://fr.wikipedia.org/wiki/S-Video){:target="_blank"}
[^ddc]: Cf. [Wikipedia DDC](https://fr.wikipedia.org/wiki/Display_Data_Channel){:target="_blank"}
[^svideo_pinout]: Cf. [Pinoutguide - S-Video](https://pinoutguide.com/Audio-Video-Hardware/SVideo_pinout.shtml){:target="_blank"}