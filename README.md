# latex-tudfp

Diese inoffizielle, nicht genehmigte LaTeX-Klasse, eignet sich zur Erstellung von Protokollen für das Physikalische Praktikum für Fortgeschrittene. Sie kann frei verwendet werden. Die [Vorgaben](http://www.physik.tu-darmstadt.de/media/fachbereich_physik/phys_studium/phys_studium_bachelor/phys_studium_bsc_praktika/fpspielregeln.pdf) der TU werden dabei umgesetzt. Es wird das [Corporate Design der TU Darmstadt](http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/) verwendet, das zunächst installiert werden muss.

## Kompatibilität

Die Klasse ist kompatibel mit pdfTeX und LuaTeX. Es wird die aktuelle Version von TeX Live/MacTeX, bzw. MikTeX (nach 21. April 2015) benötigt. Eventuell muss ein Update vorgenommen werden. Sofern `xetex-inputenc` vorhanden ist, kann auch XeTeX verwendet werden, anders ist die Unterstützung leider momentan nicht möglich, soweit ich weiß.

## Verwendung
Die Klasse basiert auf `tudreport`. Alle Optionen, die für diese Klasse, verwendet werden können, können auch für die Klasse `tudfp` verwendet werden. Die Datei `tudfp.cls` muss in den gleichen Ordner kopiert werden.

```
\documentclass[
    abteilunga,
    english,ngerman
]{tudfp}
```

`english` und `ngerman` *müssen* dabei verwendet werden, wobei die letzte angegebene Sprache aktiv ist. Texte werden automatisch in der korrekten Sprache angezeigt (für Deutsch und Englisch). Mit `abteilunga` *(IAP)*, `abteilungb` *(FKP)* oder `abteilungc` *(IKP)* wird die Abteilung, in der der Versuch durchgeführt wird, spezifiziert. Die Farbe wird automatisch an die jeweilige Institutsfarbe angepasst, kann aber weiterhin mit `accentcolor=…` modifiziert werden. Die Option `nocolorback` deaktiviert das Verschwenden von Druckerfarbe für die Titelseite.

## Titelseite mit Informationen zum Protokollen

Die Titelseite enthält diverse Informationen zum Versuch, wie den Titel, die Namen der Versuchsteilnehmer, eine Eigenständigkeitserklärung, etc. Die Eigenschaften werden mit folgenden Befehlen festgelegt:


`\VersuchsNr`, `\Titel`: Die Nummer und der Name des Versuchs. Für den Fall, dass man TeX-Code im Titel verwenden möchte, kann optional mit `\UTitel` einen alternativen Titel angeben, der als PDF-Titel verwendet wird, z. B.:

```
\Titel{{\(\gamma\)-Strahlung}}
\UTitel{{γ-Strahlung}}
```

`\Betreuer`: Der Name des Betreuers, mit dem der Versuch durchgeführt wurde.

`\LabDate`, `\ReleaseDate`: Datum der Versuchsdurchführung & -Abgabe (Format: YYYY-MM-DD).

`\AutorA`, `\AutorB`: Die Namen der beiden Versuchsteilnehmer.

`\AutorAMatr`, `\AutorBMatr`: Die Matrikelnummern der beiden Versuchsteilnehmer.

`\AutorAMail`, `\AutorBMail`: Die E-Mail-Adressen der beiden Versuchsteilnehmer.

## Beispiel
In der Datei `tudfp-example.tex` wird gezeigt, wie eine mögliche Verwendung der Klasse aussehen kann. Die Klasse ist auf eine möglichst einfache Verwendung ausgelegt, und kümmert sich eigentlich um alles notwendige zur Erstellung eines guten Dokuments. Die Beispieldatei kann man eigentlich genauso direkt übernehmen, und muss nur die Versuchseigenschaften ändern (und natürlich das Protokoll schreiben).

## Automatisch geladene Pakete
Folgende Pakete werden automatisch geladen, da man sie wahrscheinlich sowieso immer benötigt, ansonsten sollten sie nicht stören: `mathtools`, `siunitx`, `tabularx`, `cleveref`. Automatisch werden für die Dokumentenerstellung zudem u. a. `hyperref`, `babel` und `datetime2` eingebunden. Das `biblatex`-Backend wird auf biber gesetzt (falls `biblatex` verwendet wird).

## Andere Vorlagen
Weitere Vorlagen von mir finden sich unter [op3/tex-templates](https://github.com/op3/tex-templates).
