# TeX Vorlagen

Meine eigenen TeX Vorlagen. Diese sind in der Regel kompatibel mit pdfTeX, XeTeX und LuaTeX, wobei diese auf LuaTeX optimiert wurden. Es wird die aktuelle Version von TeX Live/MacTeX, bzw. MikTeX (nach 21. April 2015) benötigt. Eventuell muss ein Update vorgenommen werden.

## tex-article.tex
Dies ist eine einfache Vorlage für einen auf KOMA-Script basierenden Artikel. Dies ist weitestgehend eine grundlegende Implementierung meiner eigenen Empfehlungen ohne weitere Modifikationen. Auf dieser Grundlage können komplexere Vorlagen oder einfache Artikel erstellt werden.

## fp-tudreport.tex
Diese Vorlage eignet sich zur Erstellung von Protokollen für das Physikalische Praktikum für Fortgeschrittene. Die [Vorgaben](http://www.physik.tu-darmstadt.de/media/fachbereich_physik/phys_studium/phys_studium_bachelor/phys_studium_bsc_praktika/fpspielregeln.pdf) der TU werden dabei umgesetzt. Es wird das [Corporate Design der TU Darmstadt](http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/) verwendet. Die Vorlage eignet sich zur Verwendung mit pdfTeX und LuaTeX, als Standard-Backend für das Literaturverzeichnis wird Biber verwendet. Falls `xetex-inputenc` vorhanden ist, funktioniert es auch mit XeTeX.

Im Präambel werden zunächst die benötigten Pakete eingebunden, wobei einige evtl. nützliche Pakete bereits eingebunden wurden, oder nur noch einkommentiert werden müssen. Zum Einbinden eines Literaturverzeichnisses kann `\addbibresource` verwendet werden.

Anschließend werden allgemeine Dokumenteninformationen definiert:

`\VersuchsNr`, `\Titel`: Die Nummer und der Name des Versuchs.

`\Abteilung`: Die Abteilung, in der der Versuch durchgeführt wird, z. B. `A` *(IAP)*, `B` *(FKP)* oder `C` *(IKP)*.

`\Betreuer`: Der Name des Betreuers, mit dem der Versuch durchgeführt wurde.

`labdate`: Das Datum der Versuchsdurchführung im Format YYYY-MM-DD.

`releasedate`: Das Abgabedatum im Format YYYY-MM-DD.

`\AutorA`, `\AutorB`: Die Namen der beiden Versuchsteilnehmer.

`\AutorAMatr`, `\AutorBMatr`: Die Matrikelnummern der beiden Versuchsteilnehmer.

`\AutorAMail`, `\AutorBMail`: Die E-Mail-Adressen der beiden Versuchsteilnehmer.

Es kann zudem bei der Definition der Dokumentenklasse eine Farbe festgelegt werden. Bei den Institutsfarben handelt es sich anscheinend um `tud2b` für Abteilung A/IAP, `tud9c` für Abteilung B/FKP und `tud8b` für Abteilung C/IKP.

Es sind keine weiteren Modifikationen im Präambel notwendig.

Falls gewünscht, kann die Sprache unter *Allgemeine Pakete* auf `english` geändert werden. Alle passenden Texte, sowie die Datumsangaben, werden dann automatisch auf englisch dargestellt. Die *letzte* aufgeführte Sprache beim Einbinden von babel wird automatisch aktiviert, im Normalfall also deutsch.
