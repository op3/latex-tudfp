% Copyright (c) 2015 O. Papst

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% tudfp is a tudreport-based class aimed at creating FP protocols, while
% following the TUD-Design-Manual and the "Spielregeln des FP".

\def\filedate{2015-05-05}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudreport}
 [\filedate\space O. Papst's FP-documentclass based on
   Clemens von Loewenich's and Joe Werner's TUD-Design package]

\ClassInfo{tudfp}{Die Klasse ist momentan noch in der Alpha-Phase, die Verwendung wird noch nicht empfohlen.}

% Dokumentenklasse mit Optionen
\DeclareOption{abteilunga}{\@abtatrue}
\DeclareOption{abteilungb}{\@abtbtrue}
\DeclareOption{abteilungc}{\@abtctrue}
\LoadClass[
    colorback,                   % Druckertinte für Titelseite verschwenden
    oneside,
    10pt,                        % 9.5pt (default) wären etwas klein
    article                      % Passt besser auf Bedürfnisse
]{tudreport}

\if\@abtatrue\then
    \DeclareOption*{\PassOptionsToClass{accentcolor=tud2b}{tudreport}}
    \gdef\@Abteilung{A}
\else\if\@abtbtrue\then
    \DeclareOption*{\PassOptionsToClass{accentcolor=tud9c}{tudreport}}
    \gdef\@Abteilung{B}
\else\if\@abtctrue\then
    \DeclareOption*{\PassOptionsToClass{accentcolor=tud8b}{tudreport}}
    \gdef\@Abteilung{C}
\else
    \ClassWarning{tudfp}{Es wurde keine Abeiltung als Klassenoption angegeben.}
    \gdef\@Abteilung{}
\fi



%    accentcolor=tud2b,           % Farbe (Abteilung A: 2b, B: 9c, C: 8b)

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tudreport}}
\ProcessOptions\relax




%-----------------------------------------------------------------------------
% Allgemeine Pakete
  \RequirePackage{babel}
  \RequirePackage{iflang}
  \RequirePackage{etoolbox}
  \RequirePackage[useregional]{datetime2} % Datum in richtiger Sprache
  \RequirePackage[utf8]{luainputenc}% Automatisch xetex-/lua/inputenc.
  \RequirePackage{microtype}        % Bessere Typographie

%-----------------------------------------------------------------------------
% Weitere immer benötigte Pakete
  \RequirePackage{mathtools}        % Mathematik
  \RequirePackage{amssymb}          % + Symbole
  \RequirePackage{siunitx}          % Zahlen mit Einheiten
  \addto\extrasngerman{\sisetup{locale = DE}}
  \addto\extrasenglish{\sisetup{locale = US}}
  
  \PassOptionsToPackage[backend=biber,style=alphabetic]{biblatex} % Bibliograhie
  
  \RequirePackage{tabularx}



\DeclareStringOption{abteilung}

%
% Prepare title page
% define subtitle and subsubtitle
\def\VersuchsNr#1{\gdef\@VersuchsNr{#1}}
\gdef\@VersuchsNr{\ClassWarning{tudfp}{No \noexpand\VersuchsNr given}}
\def\Titel#1{\gdef\@Titel{#1}}
\gdef\@Titel{\ClassWarning{tudfp}{No \noexpand\Titel given}}
\def\UTitel#1{\gdef\@UTitel{#1}}
\gdef\@UTitel{\@Titel}


\def\Betreuer#1{\gdef\@Betreuer{#1}}
\gdef\@Betreuer{\ClassWarning{tudfp}{No \noexpand\Betreuer given}}
% TOOD labdate releasedate

  \DTMsavedate{labdate}{2016-02-16} % Durchgeführt am
  \DTMsavedate{releasedate}{2016-02-17} % Abgabe


\def\AutorA#1{\gdef\@AutorA{#1}}
\gdef\@AutorA{}
\def\AutorAMatr#1{\gdef\@AutorAMatr{#1}}
\gdef\@AutorAMatr{}
\def\AutorAMail#1{\gdef\@AutorAMail{#1}}
\gdef\@AutorAMail{}

\def\AutorB#1{\gdef\@AutorB{#1}}
\gdef\@AutorB{}
\def\AutorBMatr#1{\gdef\@AutorBMatr{#1}}
\gdef\@AutorBMatr{}
\def\AutorBMail#1{\gdef\@AutorBMail{#1}}
\gdef\@AutorBMail{}

  
% Infos korrekt setzen
  \newcommand{\Author}{{\@AutorA, \@AutorB}}
  \newcommand{\FullTitle}{{\@VersuchsNr: \@Titel}}
  \newcommand{\Subtitle}{{
  \begin{tabular}{|l|l|}
    \@AutorA & \@AutorB \\
    \textaccent{\IfLanguageName{ngerman}{Matrikel-Nr.}{Matriculation no.}: \@AutorAMatr} & \textaccent{\IfLanguageName{ngerman}{Matrikel-Nr.}{Matriculation no.}: \@AutorBMatr} \\
    \textaccent{\href{mailto:\@AutorAMail}{\@AutorAMail}} & \textaccent{\href{mailto:\@AutorBMail}{\@AutorBMail}} \\
  \end{tabular}\\
  }}
  \newcommand{\Subsubtitle}{{\IfLanguageName{ngerman}{Betreuer}{Tutor}: \@Betreuer\\
    \IfLanguageName{ngerman}{Versuch durchgeführt am}{Experiment conducted on}: \DTMusedate{labdate}\\
    \IfLanguageName{ngerman}{Abgabedatum}{Submission date}: \DTMusedate{releasedate} }}
  \newcommand{\Institution}{{Physikalisches Praktikum\\für Fortgeschrittene\\\\Abteilung \@Abteilung}} % Nicht übersetzen
  \newcommand{\StatutoryDec}{{\IfLanguageName{ngerman}{Hiermit versichern wir, das vorliegende Protokoll für das Physikalische Praktikum für Fortgeschrittene ohne Hilfe Dritter nur mit den angegebenen Quellen und Hilfsmitteln angefertigt zu haben. Alle Stellen, die aus Quellen entnommen wurden, sind als solche kenntlich gemacht. Diese Arbeit hat in gleicher oder ähnlicher Form noch keiner Prüfungsbehörde vorgelegen.}{We hereby confirm that the work presented in this protocol for the \foreignlanguage{ngerman}{Physikalisches Praktikum für Fortgeschrittene} has been conducted without any help of third parties, solely based on the stated sources and tools. All material which has been quoted from the used sources has been explicitly marked. Neither this, nor a similar work, has been presented to an examination committee.}
  
  \vspace{5ex}
  \begin{tabularx}{\linewidth}{Xll}
 Darmstadt, \IfLanguageName{ngerman}{den }{}\DTMusedate{releasedate}, & \makebox[12em]{\hrulefill} & \makebox[12em]{\hrulefill}\\
    & \parbox[t]{12em}{\@AutorA} & \parbox[t]{12em}{\@AutorB}\\
\end{tabularx}
  }}


% AtBeginDocument AfterEndPreamble ...
%-----------------------------------------------------------------------------
% Hyperref  
\AtEndPreamble{
  \RequirePackage{hyperref}
  \hypersetup{%
    unicode,
    pdfdisplaydoctitle,  % Titel in Titelleiste
    linktoc=all,         % TOC: Seitenzahlen verlinken
    pdfauthor={\Author},
    pdftitle={\FullTitle},
    pdfproducer={LaTeX TUD-CD (C. v. Loewenich \& J. Werner), LaTeX TUD-FP (O. Papst)}
  }
  \RequirePackage{cleveref}
}


\AfterEndPreamble{
  % Titelinformationen
  \title{\FullTitle}
  \subtitle{\Subtitle}
  \subsubtitle{\Subsubtitle}
  \institution{\Institution}
  \sponsor{\StatutoryDec}
}






%-----------------------------------------------------------------------------
\endinput
