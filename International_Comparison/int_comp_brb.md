---
title: "Vergütung von hausräztlichen Leistungen"
author: "Beat Brüngger"
classoption: a4paper
output:
  pdf_document:
    keep_tex: true
    number_sections: yes
    toc: yes
    includes:
      before_body: title.tex
  html_document:
    toc: yes
email: beat.bruengger@gmx.ch
date: Sept. 8, 2016
abstract: "Das in der Schweiz bei der Vergütung von ambulanten Gesundheitsleistungen vewendete Tarifsystem TARMED wurde 2004 eingeführt, und bedarf anerkannterweise einer Reform. Die darin aufgeführten Einzelleistungen haben aus heutiger Sicht vielfach keinen sachgerechten Preis mehr, was zu Fehlanreizen führt.   Aufgrund der diametral entgegengesetzten Interessen der beiden Tarifpartner Ärzteschaft und Krankenversicherer sind die Verhandlungen rund um die Tarifrefom seit Jahren blockiert.  
Ausserdem steigen die Gesundheitsausgaben in einem so starken Ausmass, dass auf politischer Ebene Lösungen gefordert werden, welche das Gesundheitssystem langfristig finanzierbar halten.  
Steigende Gesundheitskosten sind auch in den benachbarten Ländern ein vieldiskutiertes Thema. Aus diesem Grund sollen die in anderern Ländern vorhandenen Lösungsansätze für dieses Problem auf deren Tauglichkeit für die Anwendung in der Schweiz überprüft werden."
lang:  de-CH
header-includes:
- \usepackage{fancyhdr}
- \pagestyle{fancy}
- \fancyhead{}
- \renewcommand{\headrulewidth}{0pt}
- \fancyfoot[C]{Vergütung von hausräztlichen Leistungen}
- \fancyfoot[LE,RO]{\thepage}
documentclass: article
subtitle: Die Situation in der Schweiz im Vergleich zu Ansätzen im benachbarten Ausland
bibliography: bebru.bib
---

\pagebreak

# Einführung

Die Vergütung von ambulanten ärztlichen Leistungen wird in der Schweiz über das Tarifwerk TARMED (***tar***if ***méd***ical) geregelt, sowohl bei Grundversorgern, als auch bei Spezialärzten. Der TARMED wurde per 1.1.2004 eingeführt, und ist ein Einzelleistungstarif (engl.: fee-for-service, FFS). Das bedeutet, dass anerkannte Leistungserbringer für das Erbringen jeder im TARMED aufgeführten Leistung einen im Voraus bekannten Preis verrechnen können.  
Wie bereits in der von der Eidgenössischen Finanzkontrolle EFK 2010 erstellten Evaluation der Zielerreichung des TARMED [@sangra_tarmed_2010] beschrieben, bietet die aktuelle Implementation dieses Systems verschiedene Schwachstellen. Insbesondere die ebenda auf Seite 92 beschriebenen Fehlanreize durch zu tief resp. zu hoch bewerteten Leistungen führen in der Schweiz aktuell zu Problemen in der Vergütung von ambulanten Gesundheitsleistungen. Der Bericht führt unter anderen folgende beiden Punkte auf:

* Steigende Kosten in den Sozialversicherungen durch vermehrte Abrechnung von zu hoch bewerteten Leistungen, "obwohl sie evtl. medizinisch nicht unbedingt notwendig wären."
* Ungleiche Einkommensentwicklung, je nach Spezialität der Ärzte, da operativ tätige Ärzte mittels Verbesserung der Effizienz einen grösseren Handlungsspielraum haben ihr Einkommen zu steigern, als dies Grundversorger haben.

Diese beiden Punkte bedeuten, dass die vorhandenen Fehlanreize im Einzelleistungstarif TARMED potentiell dazu führen, dass eine Mengenausweitung an medizinischen Leistungen einen stärker als nötigen Anstieg der Gesundheitskosten zur Folge hat, teilweise  medizinisch nicht sinnvolle Behandlungen durchgeführt werden, und dass weniger Ärzte in Ausbildung sich für eine Spezialisierung in Hausarztmedizin entschliessen, als dies für eine flächendeckende Versorgung nötig wäre. Indbesonderer in ländlichen Regionen der Schweiz ist die Dichte an Grundversorgern tiefer, als erwünscht ist.  
Aktuell werden steigenden Gesundheitskosten und der Mangel an Hausärzten im Zuge der zum wiederholten Male gescheiterten Revision des TARMED, und der bevorstehenden Bekanngabe der Prämien der Grundversicherung OKP für das kommende Jahr, auch in den Medien diskutiert (z.B. in  @forster_steigende_2016 und @nordwestschweiz_schweiz_2016).  
Im Masterplan "Gesundheit 2020" [@edi_gesundheit_2013] adressiert das Eidgenössische Departement des Inneren (EDI) zudem die obigen Punkte im "Ziel 2.2: Gesundheit durch Effizienzsteigerungen bezahlbar halten". Gemäss dem  EDI müssen hierzu Fehlanreize im Vergütungssystem der ambulanten Versorgung (unter anderen: TARMED) beseitigt werden, und Massnahmen zur Effizienzsteigerung und Massnahmen zur Qualitätssteigerung sich gegenseitig unterstützen und gemeinsam geplant werden. Konkretisiert wird dieses Ziel mit einer dazu zugeordneten Massnahme: "Stärkung der Pauschalabgeltungen gegenüber den Einzelleistungstarifen sowie Revision bestehender Tarife (bspw. TARMED), um die Anreize zur Ausdehnung des Angebotes bei den Leistungserbringenden einzuschränken."  

# Vorgehensweise

Die Literaturrechereche wurde nicht systematisch durchgeführt. Neben Dokumenten der eidg. Verwaltung und des European Observatory on Health Systems and Policies sind über [Google Scholar](scholar.google.ch) gefundene Dokumente in diese Arbeit eingeflossen.  

* Für die Beurteilung der aktuellen Situation in der Schweiz wird auf Dokumente der eidg. Verwaltung (@sangra_tarmed_2010 und @edi_gesundheit_2013) zurückgegriffen.  
* Das European Observatory on Health Systems and Policies zeigt in @thomson_financing_2009 die Palette der in der Europäischen Union in Gebrauch befindlichen Vergütungssysteme auf.  
* Anhand des Fallbeispiels Niederlande, beschrieben in @smolders_optimal_2007, werden die Vor- und Nachteile unterschiedlicher Vergütungssysteme angeschaut, und das System in den Niederlanden evaluiert.  

Aufgrund dieser Auslegeordnung werden schlussendlich mögliche Anpassungen im in der Schweiz implementierten System diskutiert.  

# Resultate und Diskussion

## Vergütungssystem in der Schweiz

In der Schweiz kommt in der Vergütung hausärztlicher Leistungen mit dem Tarifwerk TARMED ein Einzelleistungstarif (FFS) zur Anwendung. Jede von einem anerkannten Leistungserbringer erbrachten Leistung hat einen je nach Kanton unterschiedlichen Preis. Dieser kann dem Patienten resp. dessen Krankenversicherung in Rechnung gestellt werden.  
Daneben kommt in einigen Versicherungsmodellen (üblicherweise unter der Bezeichnung Managed Care bekannt), welche Krankenversicherungen freiwillig anbieten können, ein Capitationsystem zur Anwendung. Hierbei wird mit einem Netzwerk von Ärzten aufgrund des ihm zugeordneten Versichertenkollektivs ein (teilleiweise risikoadjustiertes) Budget vereinbart. Benötigt das Ärztenetzwerk für die Behandlung des Versichertenkollektivs in einem Jahr weniger als das vereinbarte Budget, erhält es von der Versicherung einen Teil des gegenüber dem Budget eingesparten Betrags als Bonus ausbezahlt. Bei Überschreitung des Budgets muss das Netzwerk der Versicherung möglicherweise einen Malus zahlen. Die genauen Modalitäten dieser Vereinbarungen werden zwischen den Versicherungen und den Ärztenetzwerken verhandelt, und variieren deshalb. Die Versicherten erhalten für die Teilnahme an einem solchen Versicherungsmodell einen Rabatt auf ihre Versicherungsprämie.  
Somit kommt in der Schweiz ein gemischtes System, bestehend aus FFS und Capitation mit Budgetverantwortung, zur Anwendung. Gundlange für das Einkommen der Grundversoger bildet dabei immer der Einzelleistungstarif. Das Capitationsystem modifiziert über die Zahlungen des Ärztenetzwerks allenfalls die Einnahmen der einzelnen Ärzte.

## Überblick über verschiedene Vergütungssysteme in der EU

Wie die folgende Tabelle aus @thomson_financing_2009, Seiten 42-43, zeigt, kommt zum Zeitpunkt der Studie bei der Vergütung von Grundversorgern in den meisten Ländern der EU, wie auch in der Schweiz, ein System mit einer Mischung aus FFS und Capitation zur Anwendung. Insbesondere einige der neueren Länder der EU haben ihr Gesundheitssystem weg von fixen Salären (welche ebenfalls weiter vorkommen) und hin zu FFS resp. Capitation reformiert, seltener mit zusätzlichen performance-abhängigen Zahlungen (@thomson_financing_2009, Seiten 85-86).  
Der Reformprozess ist auch in vielen EU-Mitgliedsstaaten noch nicht abgeschlossen, wobei hauptsächlich weiter ausdifferenzierte Vergütungssysteme, welche die erbrachte Menge an Leistungen und deren Qualität miteinbezieht, folgen sollen. Eine Verlinkung von performance-abhängigen Zahlungen mit dem gesundheitsrelevanten Ergebnis der Behandlung soll gemäss @thomson_financing_2009, Seite 92, weiter vorangetrieben werden.  

| Land | Finanzierung Grundversorgung |
|--------|------------------------------------------------------------------------------------------------|
| AT | Allowances (80%) + FFS (contracted), FFS (non-contracted) |
| BE | FFS |
| BG | Capitation + bonuses |
| CY | Salary (public), FFS (private) |
| CZ | Age-weighted capitation + FFS |
| DK | Capitation + FFS |
| EE | Age-weighted capitation + FFS |
| FI | Salary + FFS or a mix of salary, capitation + FFS for personal doctors (public), FFS (private) |
| FR | FFS |
| DE | FFS points |
| EL | Salary + FFS (public), FFS (private) |
| HU | Weighted capitation + adjustments based on provider characteristics |
| IE | Weighted capitation + FFS |
| IT | Capitation + FFS + PRP (also for paediatricians) |
| LV | Age-weighted capitation + FFS |
| LT | Age-weighted capitation |
| LU | FFS |
| NL | Salary |
| MT | Capitation + FFS |
| PL | Age-weighted capitation |
| PT | Salary (NHS) + capitation + PRP |
| RO | Age-weighted capitation + FFS (15%) |
| SI | Age-weighted capitation + FFS |
| SK | Capitation + FFS (50%) |
| ES | Salary + age-weighted capitation (15%) |
| SE | Salary or capitation + some FFS |
| UK-ENG | Weighted capitation + FFS + PRP |

Quellen: [^5fff5edb], Abkürzungen: [^df77774b]

[^5fff5edb]: Quellen: European Observatory on Health Systems and Policies Health Systems in Transition series reports.

[^df77774b]:
Abkürzungen: FFS: Fee-for-service (payments); PRP: Performance-related pay.

## Überlegungen zu einem optimalen Vergütungssystem aus den Niederlanden

Die Grundversorger üben in den Niederlanden eine Gatekeeping-Funktion aus. Der erste Kontakt mit dem Gesundheitssystem ist zwingend bei einem Hausarzt, welcher die weitere Versorgung koordiniert. Das Vergütungssystem für Grundversoger wurde in den Niederlanden per 1.1.2006  reformiert. Die davor vorhandene Trennung zwischen öffentlich und privat versicherten Personen, mit unterschiedlichen Zahlungssystemen bei deren Behandlung, wurde aufgehoben. Neu kommt ebenfalls eine Mischung aus Capitation und FFS zur Anwendung.  
In @smolders_optimal_2007 wird dieses neue System evaluiert, und werden Vorschläge zur Optmierung bezüglich Minimierung der (gesamten) Gesundheitsausgaben, sowie zu Qualität und Zugang zum Gesundheitssystem präsentiert.  
Das Wechsel zu einem Mischsystem aus Capitation und FFS wird als eine Verbesserung zu den vorherigen reinen Capitation- (öffentlich verischerte Personen), resp. FFS-Systeme (privat versicherte Personen) angesehen. Vorher vorhandene unerwünschten Anreize konnten durch diesen Wechsel vemindert werden.  
Da ein Capitationsystem Anreize zu einer Unterproduktion mit sich bringt, und ein FFS-System die Ärzte eher zu einer Überproduktion motiviert, ethische Grundsätze der Ärzte aber eine Unterproduktion nur begrenzt zulassen, soll das Vergütungssystem hauptsächlich aus einem risikoadjustierten Capitationbeitrag, und zusätzlichen FFS-Beiträgen bestehen - wie dies aktuell in den Niederlanden der Fall ist. Verbessert werden könnte das System allenfalls dadurch, dass die dokumentierte Verwendung von Protokollen und Guidelines über spezifische Positionen im Einzelleistungstarif vergütet wird.  
Zur Einführung von Budgets für Grundversorger für weitergehende Behandlungen bei Spezialärzten oder stationären Einrichtungen, wird in @smolders_optimal_2007 aus den folgenden Gründen abgeraten:

* Das zusätzliche finanzielle Risiko für Grundversorger würde dazu führen, dass diese dafür eine Risikoprämie verlangen würden. Krankenversicherungen können dieses Risiko aufgrund des grösseren Versichertenkollektivs besser tragen.
* Durch die sich konkurrenzierenden Krankenversicherungen gibt es in den Niederlanden bereits Leistungseinkäufer, welche versuchen hohe Qualität zu günstigen Preisen einzukaufen. Weiter Konkurrenz unter den Ärzten würde hier keinen Nutzen bringen.
* Die Grundversorger haben eine kleinere Markmacht als Krankenversicherungen, auch wenn sie sich zusammenschliessen.
* Budgets für weitergehende Behandlungen belasten potentiell das Verhältnis zu den Klienten.

Budgets für Medikamente werden ebenfalls nicht empfohlen. Auch hier könnte Misstrauen der Klienten das Verhältnis zum Arzt beeinträchtigen. Anstelle von Anreizen für tiefe Medikamentenverschreibungen werden konkrete Einschränkungen vorgeschlagen. Beispielsweise könnte nur die jeweils günstigste Variante eines bestimmten Medikamentes vergütet werden. Auch die Verwendung von Generika kann vorausgesetzt werden, wo dies möglich ist, um Kosten zu sparen.  
Insgesamt wird die Mischung aus Capitation und FFS als ideal angesehen, und es stellt sich lediglich die Frage, zu welchen Teilen diese beiden Systeme zum Einkommen der Grundversorger beitragen sollen. Von stärkeren finanziellen Anreizen für Grundversorger, z.B. durch Budgets, wird abgeraten.  

## Vergleich der Systeme in der Schweiz und den Niederlanden

Die Vergütungssysteme der Grundversorger in der Schweiz und den Niederlanden gleichen sich insofern, als dass beide eine Mischung aus Capitation uns FFS beinhalten. Der grösste Unterschied besteht darin, dass in den Niederlanden der Capitationbeitrag den grössten Anteil am Einkommen der Ärzte hat. In der Schweiz beziehen Ärzte ihr Einkommen haupsächlich aus FFS-Beiträgen;  allfällige Capitationzahlungen (üblicherweise im Zusammenhang mit einem Budget) spielen nur eine marginale Rolle. Ärzte können sich in der Schweiz auch völlig vom Capitationsystem fernhalten, und ihr Einkommen ausschliesslich aus FFS-Beiträgen beziehen.  
Da Capitationsysteme Anreize zu einer Unter- und FFS-Systeme zu einer Überproduktion an Gesundheitsleistungen setzen, ist anzunehmen, dass das schweizerische System mehr zu Überproduktion neigt, als dasjenige in den Niederlanden.  
Ein weiterer Unterschied in den beiden Ländern ist, dass in den Niederlanden die Grundversorger gesetzlich vorgeschrieben eine Gatekeeping-Rolle ausüben (kein direkter Zugang zu Spezialärzten). In der Schweiz soll diese Rolle über die Budgetmitverantwortung in Capitationverträgen gestärkt werden. Da solche Verträge wenig verbreitet sind, und die Behandlung bei Spezialärzten als teuer gilt, ist dies ein weiterer möglicher Grund, weshalb die Gesundheitskosten in der Schweiz höher sind als in den Niederlanden.

# Schlussfolgerungen

Mit dem Mischssystem aus FFS und Capitation macht die Schweiz in der Vergütung der hausärztlichen Leistungen das, was auch im benachbarten Ausland üblich ist. Allerdings ist in der Schweiz nicht nur der Reformbedarf gross, sondern auch das Potential für Verbesserungen im heutigen System gegeben. Die Niederlande gibt hierbei durchaus ein valables Vorbild ab, deren System zurzeit zusammen mit demjenigen in Deutschland auch tatsächlich vom Departement des Inneren EDI analysiert wird [@edi_mengenwachstum_2016].  
Wie bereits im Masterplan "Gesundheit 2020" [@edi_gesundheit_2013] als mögliche Massnahme zum Ziel 2.2 angetönt wird, könnte insbesondere die weitere Verbreitung und höhere Gewichtung der Capitationbeiträge in der Schweiz die bestehenden Probleme potentiell mildern. Namentlich könnte dies einen dämpfenden Effekt auf die Menge der erbrachten ambulanten Gesundheitsleistungen, und damit auf die totalen Gesundheitskosten, haben. Zudem könnten dadurch die finanziellen Anreize für junge Ärzte, sich zu Grundversorgern auszubilden und sich in ländlichen Regionen anzusiedeln, vergrössert werden.    
Ein weiterer Vorteil von Capitationsystemen ist, dass diese weniger an Innovationen angepasst werden müssen, als dies bei FFS-Systemen der Fall ist (in welchen jede abrechenbare Behandlungsmethode einzeln aufgeführt werden muss). Durch eine stärkere Gewichtung der Capitation könnte so auch der Druck in den Tarifverhandlungen verringert werden, wenn der verhandlungsintensive Einzelleistungstarif einen kleineren Anteil am Einkommen der Ärzte hat.  
Politisch kaum eine Chance dürfte in der Schweiz die Einschränkung des Zugangs zu Spezialärzten wie in den Niederlanden haben. Auch wenn dadurch die Steigerung der Gesundheitskosten durch die Stärkung der Hausarztmedizin und deren Gatekeeping-Rolle erwartet werden könnte, haben vergangene Abstimmungen in der Schweiz gezeigt, dass ein solches Anliegen beim Stimmvolk auf wenig Akzeptanz stossen würde.

# Bibliography
