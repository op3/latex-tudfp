% Copyright (c) 2015 O. Papst

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% tudfp is a tudreport-based class aimed at creating FP protocols, while
% following the TUD-Design-Manual and the "Spielregeln des FP".
% It is not an official class provided by the TU.
% See https://github.com/op3/latex-tudfp

\def\filedate{2015/05/07}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudfp}[\filedate\space O. Papst's FP-documentclass based on
   Clemens von Loewenich's and Joe Werner's TUD-Design package]

% Options for the class
% Set color depending on the department
\DeclareOption{abteilunga}{
    \PassOptionsToClass{accentcolor=tud2b}{tudreport}
    \gdef\@Abteilung{A}}
\DeclareOption{abteilungb}{
    \PassOptionsToClass{accentcolor=tud9c}{tudreport}
    \gdef\@Abteilung{B}}
\DeclareOption{abteilungc}{
    \PassOptionsToClass{accentcolor=tud8b}{tudreport}
    \gdef\@Abteilung{C}}

\gdef\@Abteilung{\ClassWarning{tudfp}{Es wurde keine Abteilung als Klassenoption angegeben.}}


\newif\ifcolorback

% Make it possible to disable the colorback
\colorbacktrue
\DeclareOption{nocolorback}{\colorbackfalse}
\ProcessOptions\relax

\ifcolorback \PassOptionsToClass{colorback}{tudreport}
\fi


% Make it possible to hide matriculation number and email-address
\newif\ifcensor
\censorfalse
\DeclareOption{censor}{\censortrue}
\ProcessOptions\relax

\newcommand{\censor}[1]{#1}
\ifcensor
\newlength{\censorwidth}
\renewcommand{\censor}[1]
{%
    \settowidth{\censorwidth}{#1}%
    \rule[-0.2em]{\censorwidth}{1.125em}%
}
\fi


% recessively set default options
\PassOptionsToClass{10pt}{tudreport} % 9.5pt (default) is a little too small
\PassOptionsToClass{article}{tudreport}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tudreport}}
\ProcessOptions\relax

\LoadClass{tudreport}


% General packages
\RequirePackage{babel}
\RequirePackage{iflang}
\RequirePackage{etoolbox}
\RequirePackage[useregional]{datetime2} % Dates in right language.
\RequirePackage[utf8]{luainputenc}% Automatically use xetex-/lua/inputenc.
\RequirePackage{microtype}        % Better typography.


% always needed packages
\RequirePackage{mathtools}        % set math
% \RequirePackage{amssymb}        % + symbols (not working?)
\RequirePackage{siunitx}          % numbers with units
\RequirePackage{tabularx} 
\addto\extrasngerman{\sisetup{locale = DE}}
\addto\extrasenglish{\sisetup{locale = US}}

\PassOptionsToPackage{backend=biber,style=alphabetic}{biblatex} % bibliograhy



% Prepare title page
% Define commands used to set variables
\def\VersuchsNr#1{\gdef\@VersuchsNr{#1}}
\gdef\@VersuchsNr{\ClassWarning{tudfp}{No \noexpand\VersuchsNr given}}
\def\Titel#1{\gdef\@Titel{#1}}
\gdef\@Titel{\ClassWarning{tudfp}{No \noexpand\Titel given}}
\def\UTitel#1{\gdef\@UTitel{#1}}
\gdef\@UTitel{\@Titel}

\def\Betreuer#1{\gdef\@Betreuer{#1}}
\gdef\@Betreuer{\ClassWarning{tudfp}{No \noexpand\Betreuer given}}

\def\LabDate#1{\DTMsavedate{labdate}{#1}}
\def\ReleaseDate#1{\DTMsavedate{releasedate}{#1}}

\def\AutorA#1{\gdef\@AutorA{#1}}
\gdef\@AutorA{\ClassWarning{tudfp}{No \noexpand\AutorA given}}
\def\AutorAMatr#1{\gdef\@AutorAMatr{#1}}
\gdef\@AutorAMatr{\ClassWarning{tudfp}{No \noexpand\AutorAMatr given}}
\def\AutorAMail#1{\gdef\@AutorAMail{#1}}
\gdef\@AutorAMail{\ClassWarning{tudfp}{No \noexpand\AutorAMail given}}

\def\AutorB#1{\gdef\@AutorB{#1}}
\gdef\@AutorB{\ClassWarning{tudfp}{No \noexpand\AutorB given}}
\def\AutorBMatr#1{\gdef\@AutorBMatr{#1}}
\gdef\@AutorBMatr{\ClassWarning{tudfp}{No \noexpand\AutorBMatr given}}
\def\AutorBMail#1{\gdef\@AutorBMail{#1}}
\gdef\@AutorBMail{\ClassWarning{tudfp}{No \noexpand\AutorBMail given}}

  
% Create title page and set information
  \newcommand{\Author}{{\@AutorA, \@AutorB}}
  \newcommand{\FullTitle}{{\@VersuchsNr: \@Titel}}
  \newcommand{\FullUTitle}{{\@VersuchsNr: \@UTitel}}
  \newcommand{\Subtitle}{{
  \begin{tabular}{|l|l|}
    \@AutorA & \@AutorB \\
    \textaccent{\IfLanguageName{ngerman}{Matrikel-Nr.}{Matriculation no.}: \censor{\@AutorAMatr}} & \textaccent{\IfLanguageName{ngerman}{Matrikel-Nr.}{Matriculation no.}: \censor{\@AutorBMatr}} \\
    \textaccent{\censor{\href{mailto:\@AutorAMail}{\@AutorAMail}}} & \textaccent{\censor{\href{mailto:\@AutorBMail}{\@AutorBMail}}} \\
  \end{tabular}\\
  }}
  \newcommand{\Subsubtitle}{{\IfLanguageName{ngerman}{Betreuer}{Tutor}: \@Betreuer\\
    \IfLanguageName{ngerman}{Versuch durchgeführt am}{Experiment conducted on}: \DTMusedate{labdate}\\
    \IfLanguageName{ngerman}{Abgabedatum}{Submission date}: \DTMusedate{releasedate} }}
  \newcommand{\Institution}{{\textbf{Physikalisches Praktikum}\\für Fortgeschrittene\\\\Abteilung \@Abteilung}} % Do not translate
  \newcommand{\StatutoryDec}{{\IfLanguageName{ngerman}{Hiermit versichern wir, das vorliegende Protokoll für das Physikalische Praktikum für Fortgeschrittene ohne Hilfe Dritter nur mit den angegebenen Quellen und Hilfsmitteln angefertigt zu haben. Alle Stellen, die aus Quellen entnommen wurden, sind als solche kenntlich gemacht. Diese Arbeit hat in gleicher oder ähnlicher Form noch keiner Prüfungsbehörde vorgelegen.}{We hereby confirm that the work presented in this protocol for the \foreignlanguage{ngerman}{Physikalisches Praktikum für Fortgeschrittene} has been conducted without any help of third parties, solely based on the stated sources and tools. All material which has been quoted from the used sources has been explicitly marked. Neither this, nor a similar work, has been presented to an examination committee.}
  
  \vspace{5ex}
  \begin{tabularx}{\linewidth}{Xll}
 Darmstadt, \IfLanguageName{ngerman}{den }{}\DTMusedate{releasedate}, & \makebox[12em]{\hrulefill} & \makebox[12em]{\hrulefill}\\
    & \parbox[t]{12em}{\@AutorA} & \parbox[t]{12em}{\@AutorB}\\
\end{tabularx}
  }}


% Use Hyperref for PDF information
\AtEndPreamble{
  \RequirePackage{hyperref}
  \hypersetup{%
    unicode,
    pdfdisplaydoctitle,  % Title in title bar
    linktoc=all,         % TOC: link page numbers
    pdfauthor={\Author},
    pdftitle={\FullUTitle},
    pdfproducer={LaTeX TUD-CD (C. v. Loewenich \& J. Werner), LaTeX TUD-FP (O. Papst)}
  }
  \urlstyle{same}
  \RequirePackage{cleveref}
}

\AfterEndPreamble{
  % Set title information, so the \maketitle can be set properly
  \title{\FullTitle}
  \subtitle{\Subtitle}
  \subsubtitle{\Subsubtitle}
  \institution{\Institution}
  \sponsor{\StatutoryDec}
}

\endinput
