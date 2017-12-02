---
title: "Kosten-Nutzwert-Analyse von Prolong"
author: "Beat Brüngger"
date: "2 Dez. 2017"
output:
  pdf_document: default
  word_document: default
header-includes:
- \usepackage{fancyhdr}
- \pagestyle{fancy}
- \fancyhead{}
- \renewcommand{\headrulewidth}{0pt}
- \fancyfoot[C]{}
- \fancyfoot[LE,RO]{\thepage}
lang: de-CH
documentclass: article
subtitle: Leistungsnachweis Modul \"Gesundheitsökonomische Modellierung -
  Hands-on\" (1140.17)
classoption: a4paper
---

# Beschreibung des Entscheidungsproblems

In dieser Kosten-Nutzwert-Analyse soll die Behandlung von Personen mit Organum 
imaginarium mit dem Medikament *Prolong* gegenüber *best supportive care* untersucht 
werden. Als Nutzwert werden qualitätsadjustierte Lebensjahre (QALY) verwendet.  

Im PICO-Schema dargestellt sieht die Fragestellung wie folgt aus:

* **P**opulation: Personen mit Organum imaginarium
* **I**ntervention: Therapie mit Medikament *Prolong* (zusätzlich zu *best supportive care*)
* **C**omparator: Therapie mit *best supportive care*
* **O**utcome: ICER, Kosten pro gewonnenem qualitätsadjustiertem Lebensjahr (QALY)

# Modellstruktur

Für die Berechnung der Kosten und Nutzwerte für beide Behandlungsstrategien 
wird ein Markov-Modell verwendet, mit einer Zykluszeit von einem Monat.  

Für den Aufbau der Modellstruktur sind einige Vorgaben resp. Annahmen nötig, welche 
nachfolgend aufgelistet sind:

* Eine Heilung von Organum imaginarium ist nicht möglich.
* *Prolong* wird zusätzlich zur *best supportive care* eingesetzt.
* *Prolong* verlängert die Zeitspanne bis zu einer Progression, sowie die Zeit 
zwischen Progression und Tod.
* Es gibt keine Todesfälle bevor eine Progression festgestellt werden kann.
* *Prolong* wird abgesetzt, sobald eine Progression festgestellt wird.
* *Prolong* führt während der Einnahme zu einer Verschlechterung der Lebensqualität.

## Bubble plot

Diese Vorgaben und Annahmen können in einem bubble plot dargestellt werden 
(Abbildung 1). Personen mit Organum imaginarium können im verwendeten 
Modell in drei möglichen Zuständen sein: ohne Progression, mit Progression, und 
Tod. Von einem Zyklus zum nächsten können Personen entweder im bisherigen 
Zustand verharren, oder mit einer bestimmten Wahrscheinlichkeit in einen 
anderen Zustand wechseln.

![Bubble-Plot der Modellstruktur](bubble.bmp){width=300px}

## Übergangsmatrix

Für den Aufbau des Markov-Modells ist es hilfreich die verwendeten 
Wahrscheinlichkeiten pro Behandlungsstrategie in einer Übergangsmatrix 
darzustellen (Abbildung 2).  

Die Berechnung der Übergangswahrscheinlichkeiten werden von den gemessenen 
Werten der median progression-free survival, resp. median time from progression 
to death abgeleitet. Die aus diesen beiden Werten berechneten monthly hazard für 
Personen mit *best supportive care* werden für die Behandlungsstrategie mit *Prolong* 
mit entsprechenden hazard ratios multipliziert, und im Anschluss in 
Übergangswahrscheinlichkeiten umgerechnet.

![Übergangsmatrix der Modellstruktur](matrix.bmp){width=300px}

# Resultate

In Abbildung 3 sind die Kosten und Nutzwerte für die beiden 
Behandlungsstrategien dargestellt. Es lässt sich darin sehen, 
dass durch die Behandlung mit *Prolong* die Patienten durchschnittlich 
rund ein halbes Jahr länger leben. Allerdings fallen bei den so behandelten 
Personen zusätzliche Kosten von ca. CHF 45'000 an, und die Lebensqualität 
während der Behandlung ist vermindert.  

![Kosten und Nutzwerte der beiden Strategien](results.bmp){width=500px}

Als Outcome dieser Kosten-Nutzwert-Analyse sollen die zusätzlichen Kosten 
pro qualitätsadjustiertem Lebensjahr verwendet werden. Diese Betrachtungsweise 
führt zu einer inkrementellen Kosteneffektivität (ICER) von *Prolong* von 
CHF 162'463 (Abbildung 4). Pro zusätzlichem qualitätsadjustiertem Lebensjahr fallen 
somit Kosten von ca. CHF 160'000 an. 

![Inkrementelle Kosteneffektivität von Prolong](results_icer.bmp){width=400px}


## Sensitivitätsanalyse

Die Resultate einer Kosten-Nutzwert-Analyse hängen wesentlich von den 
Werten der verwendeten Parameter ab. Um den Einfluss eines bestimmten 
Parameters auf das Endergebnis zu untersuchen kann eine Sensitivitätsanalyse 
durchgeführt werden. Hierfür wird für jeweils einen Parameter nicht der Wert 
der Punktschätzung dieses Parameters verwendet, sondern die Extremwerte dessen 
Streubereichs (z.B. Konfidenzintervall).  

In Abbildung 5 und 6 sind die Resultate der Sensitivitätsanalyse von drei 
Parametern zu sehen. Es wurden drei Parameter für diese Sensitivitätsanalyse 
gewählt, welche alle direkt mit dem Medikament *Prolong* zusammenhängen:

* hr_prog: Einfluss von *Prolong* auf die Dauer bis zu einer Progression
* hr_death: Einfluss von *Prolong* auf die Dauern von einer Progression bis zum 
Tod
* ud_Prolong: Verminderung der Lebensqualität während der Einnahme von *Prolong*

![Resultate der Sensitivitätsanalyse](results_sens.bmp){width=600px}

![Tornadoplot der Sensitivitätsanalyse](tornado.bmp){width=300px}

Es lässt sich erkennen, dass die beiden Parameter hr_prog und hr_death beide 
einen sehr grossen Einfluss auf das Outcome haben. Dies ist plausibel wenn man 
bedenkt, dass diese beiden Parameter die Wirksamkeit von *Prolong* wiedergeben. 
Ist die Wirkung von *Prolong* nur klein bei vorgegebenem Preis für die Behandlung, 
sind die Kosten für den inkrementellen Nutzen entsprechend gross.  
Die Einbussen in der Lebensqualität während der Einnahme von *Prolong* (ud_Prolong) 
haben einen deutlich geringeren Einfluss auf das Outcome, wobei er ebenfalls beachtlich 
ist. Die Nebenwirkungen schmälern den Nutzen gemessen in 
QALY. Würde der Nutzen in Lebensjahren gemessen, 
hätte dieser Parameter keinen Einfluss auf das Outcome.

# Fazit

Der Gewinn von QALY bei der Behandlung von Organum imaginarium muss beim Einsatz 
von *Prolong* teuer erkauft werden. Die Effektivität des Medikaments (hr_prog, 
hr_death) ist zu schlecht um ein ICER zu erreichen, welches für die Übernahme 
der Kosten der Behandlung durch gesetzliche Krankenversicherungen 
üblicherweise akzeptiert wird.