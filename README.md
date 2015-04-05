# TeX Vorlagen

Meine eigenen TeX Vorlagen. Diese sind in der Regel kompatibel mit pdfTeX, XeTeX und LuaTeX, wobei diese auf LuaTeX optimiert wurden. Es werden jeweils meine eigenen Empfehlungen eingehalten.

## tex-article.tex
Dies ist eine einfache Vorlage für einen auf KOMA-Script basierenden Artikel. Dies ist weitestgehend eine grundlegende Implementierung meiner eigenen Empfehlungen ohne weitere Modifikationen. Auf dieser Grundlage können komplexere Vorlagen oder einfache Artikel erstellt werden.

## fp-tudreport.tex
Diese Vorlage eignet sich zur Erstellung von Protokollen für das Physikalische Praktikum für Fortgeschrittene. Die [Vorgaben](http://www.physik.tu-darmstadt.de/media/fachbereich_physik/phys_studium/phys_studium_bachelor/phys_studium_bsc_praktika/fpspielregeln.pdf) der TU werden dabei umgesetzt. Es wird das [Corporate Design der TU Darmstadt](http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/) verwendet. Die Vorlage eignet sich wieder zur Verwendung mit pdfTeX, XeTeX und LuaTeX, als Standard-Backend für das Literaturverzeichnis wird Biber verwendet.

Im Präambel werden zunächst die benötigten Pakete eingebunden, wobei einige evtl. nützliche Pakete bereits eingebunden wurden, oder nur noch einkommentiert werden müssen. Zum Einbinden eines Literaturverzeichnisses kann `\addbibresource` verwendet werden.

Anschließend werden allgemeine Dokumenteninformationen definiert:

`\VersuchsNr`, `\Titel`: Die Nummer und der Name des Versuchs.

`\Abteilung`: Die Abteilung, in der der Versuch durchgeführt wird, z. B. `A` *(IAP)*, `B` *(FKP)* oder `C` *(IKP)*.

`\Betreuer`: Der Name des Betreuers, mit dem der Versuch durchgeführt wurde.

`\LabDate`: Das Datum der Versuchsdurchführung.

`\ReleaseDate`: Das Abgabedatum.

`\AutorA`, `\AutorB`: Die Namen der beiden Versuchsteilnehmer.

`\AutorAMatr`, `\AutorBMatr`: Die Matrikelnummern der beiden Versuchsteilnehmer.

`\AutorAMail`, `\AutorBMail`: Die E-Mail-Adressen der beiden Versuchsteilnehmer.

Es sind keine weiteren Modifikationen im Präambel notwendig.
