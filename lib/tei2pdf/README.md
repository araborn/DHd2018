# Seperated Funktion
Um alle Beiträge als einzelne pdf erstellen zu können, muss im root Verzeichniss des Repositories
```
./seperated.sh
```
ausgeführt werden.
Die Funktion erstellt dann den Output Ordner mit den benötigten Unterordnern.
Die XSLT Funktionen sind so umgestellt das die PDF direkt mit dem Artikel beginnt. Seitenzahlen, Inhalts- und Authorenverzeichnisse werden nicht generiert.
Die fertigen Dateien unter output/pdf zu finden.
## Benötigte Bibliotheken
In der config_seperated.sh werden die Bibliothken zur generierung angegeben.
Benötigt werden [fop-2.3](https://xmlgraphics.apache.org/fop/download.html) und [Saxon-HE 9.9](http://saxon.sourceforge.net/#F9.9HE).
Beide werden im lib Verzeichniss gespeichert.
<br/>
Die Ordnerstruktur muss wie folgt aussehen
```
lib
- fop-2.3
-- build
-- conf
-- examples
-- lib
- SaxonHE9-9-0-2J
-- doc
-- notices
```
## Vorherige Einstellungen
Wahrscheinlich muss vor dem erstmaligen ausführen einmalig 
```
chmod -R a+x lib/fop-2.3
```
ausgeführt werden, weil sonst das System nicht benötigten Rechte bekommt. 
<br/> 
Zudem kann der Fall auftretten, dass gewissen "subcategory" Elemente nicht in  ```TEIcorpus_producer-seperated.xsl``` Zeile 40 - 48 auftauchen, diese müssten dann ergänzt werden.