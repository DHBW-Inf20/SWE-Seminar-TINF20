%%
%% This is file `lni.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% lni.dtx  (with options: `class')
%% -------:| -----------------------------------------------------------------
%%     lni:| A class for submissions to the ``Lecture Notes in Informatics''
%%  Author:| Martin Sievers
%%   Email:| martin.sievers@schoenerpublizieren.de
%% License:| Released under the LaTeX Project Public License v1.3c or later
%%     See:| http://www.latex-project.org/lppl.txt
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{lni}
    [2017/05/15 v1.4BETA Official class for submissions to the ``Lecture Notes
    in Informatics'']
\def\@clearglobaloption#1{%
  \def\@tempa{#1}%
  \def\@tempb{\@gobble}%
  \@for\next:=\@classoptionslist\do
    {\ifx\next\@tempa
       \message{Cleared  option \next\space from global list}%
     \else
       \edef\@tempb{\@tempb,\next}%
     \fi}%
  \let\@classoptionslist\@tempb
  \expandafter\ifx\@tempb\@gobble
    \let\@classoptionslist\@empty
  \fi}
\DeclareOption{latin1}{\PassOptionsToPackage{latin1}{inputenc}}
\DeclareOption{utf8}{\PassOptionsToPackage{utf8}{inputenc}}
\DeclareOption{ansinew}{\PassOptionsToPackage{ansinew}{inputenc}}
\newif\iflnienglish
\lnienglishfalse
\DeclareOption{english}{\lnienglishtrue\@clearglobaloption{english}}
\newif\ifusehyperref
\usehyperreftrue
\DeclareOption{nohyperref}{\usehyperreffalse}
\newif\ifusecleveref
\useclevereftrue
\DeclareOption{nocleveref}{\useclevereffalse}
\newif\ifusebiblatex
\usebiblatexfalse
\DeclareOption{biblatex}{\usebiblatextrue}
\newif\ifcrop
\cropfalse
\DeclareOption{crop}{\croptrue}
\newif\ifnofonts
\nofontsfalse
\DeclareOption{nofonts}{\nofontstrue}
\ExecuteOptions{utf8}
\DeclareOption*{\ClassWarning{Option `\CurrentOption` is not supported!}}
\ProcessOptions\relax
\RequirePackage{iftex}
\ifPDFTeX
   \RequirePackage{hyphsubst}
   \HyphSubstIfExists{ngerman-x-latest}%
      {\HyphSubstLet{ngerman}{ngerman-x-latest}%
       \ClassInfo{lni}{Using latest German hyphenation patterns}}%
      {\ClassWarning{lni}{Latest German hyphenation patterns could not be found!%
         \MessageBreak If you write a German article you should check your%
         installation}}%
\fi%
\LoadClass[10pt,twoside,a4paper,fleqn]{article}
\ifPDFTeX
   \RequirePackage{cmap}
   \RequirePackage{inputenc}
   \RequirePackage[T1]{fontenc}
\fi%
\iflnienglish
   \RequirePackage[ngerman,english]{babel}
\else
   \RequirePackage[english,ngerman]{babel}
\fi%
\useshorthands*{"}
\addto\extrasenglish{\languageshorthands{ngerman}}
\ifnofonts
   \ClassWarning{lni}{Option `nofonts' set! I will use standard fonts
   \MessageBreak
   instead of the New TX fonts. Your document will NOT look like the
   \MessageBreak
   final result for publication. This should only be used if you have
   \MessageBreak
   no possibility to install fonts or upgrade your TeX installation!}%
\else
   \ifPDFTeX
      \RequirePackage{newtxtext}
      \RequirePackage{newtxmath}
      \RequirePackage[zerostyle=b,scaled=.9]{newtxtt}
      \@ifpackagelater{newtxtt}{2014/11/18}%
         {\txtt@upqtrue}%
         {\ClassWarning{lni}{You are using an old version of
         `newtxtt'.\MessageBreak
          Option `straightquotes' will not be used!}}%
   \else
      \usepackage{newtxmath}
      \usepackage[no-math]{fontspec}
      \setmainfont{texgyretermes}[
        Extension = .otf,
        UprightFont = *-regular,
        BoldFont = *-bold,
        ItalicFont = *-italic,
        BoldItalicFont = *-bolditalic,
        Ligatures=TeX
      ]
   \fi%
\fi%
\ifPDFTeX
   \RequirePackage[%
      final,%
      tracking=smallcaps,%
      expansion=alltext,%
      protrusion=alltext-nott]{microtype}%
\else
   \RequirePackage[%
      final,%
      protrusion=alltext-nott]{microtype}%
\fi%
\SetTracking{encoding=*,shape=sc}{50}%
\DeclareFontFamily{U}{MnSymbolC}{}
\DeclareSymbolFont{MnSyC}{U}{MnSymbolC}{m}{n}
\DeclareFontShape{U}{MnSymbolC}{m}{n}{
    <-6>  MnSymbolC5
   <6-7>  MnSymbolC6
   <7-8>  MnSymbolC7
   <8-9>  MnSymbolC8
   <9-10> MnSymbolC9
  <10-12> MnSymbolC10
  <12->   MnSymbolC12%
}{}
\DeclareMathSymbol{\powerset}{\mathord}{MnSyC}{180}
\RequirePackage{ccicons}
\RequirePackage{etoolbox}
\newlength{\doihoffset}
\newlength{\doivoffset}
\ifcrop
   \RequirePackage[
     paperheight=23.5cm,paperwidth=15.5cm,
     total={12.6cm,19.2cm},
     includehead,
     headheight=20.39pt,
     headsep=.31cm,
     centering]
     {geometry}
   \RequirePackage[a4,center,cam,info]{crop}
   \renewcommand*\CROP@@info{{%
      \global\advance\CROP@index\@ne
      \def\x{\discretionary{}{}{\hbox{\kern.5em---\kern.5em}}}%
      \advance\paperwidth-20\p@
      \dimen@4pt
      \ifx\CROP@pagecolor\@empty
      \else
      \advance\dimen@\CROP@overlap
      \fi
      \hb@xt@\z@{%
         \hss
         \vbox to\z@{%
            \centering
            \hsize\paperwidth
            \vss
            \normalfont
            \normalsize
            \expandafter\csname\CROP@font\endcsname{%
               ``\jobname''\x
               \the\@rigyear/\the\month/\the\day\x
               \CROP@time\x
               page\kern.5em\thepage\x
               \#\the\CROP@index
               \strut
            }%
            \vskip\dimen@
         }%
         \hss
      }%
   }}%
   \setlength{\doihoffset}{1.45cm}
   \setlength{\doivoffset}{1.2cm}
\else
   \RequirePackage[
     total={12.6cm,19.2cm},
     includehead,
     headheight=20.39pt,
     headsep=.31cm,
     centering]
     {geometry}
   \setlength{\doihoffset}{4.2cm}
   \setlength{\doivoffset}{4.3cm}
\fi%
\RequirePackage[autostyle]{csquotes}
\ifusebiblatex
  \RequirePackage[%
    backend=biber,% UTF-8 support
    style=LNI,    % The GI style - see https://www.ctan.org/pkg/biblatex-lni
    natbib=true   % Required for \Citet
  ]{biblatex}[2016-09-15]% at least version 3.6 of biblatex is required.
  % Enable hyperlinked authors when using \citeauthor
  % Source: http://tex.stackexchange.com/a/75916/9075
  \DeclareCiteCommand{\citeauthor}%
    {\boolfalse{citetracker}%
     \boolfalse{pagetracker}%
     \usebibmacro{prenote}}%
    {\ifciteindex%
       {\indexnames{labelname}}%
       {}%
     \printtext[bibhyperref]{\printnames{labelname}}}%
    {\multicitedelim}%
    {\usebibmacro{postnote}}%
\fi%
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage{grffile}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\def\thisbottomragged{\def\@textbottom{\vskip\z@ plus.0001fil
\global\let\@textbottom\relax}}
\renewcommand\@pnumwidth{3em}
\renewcommand\@tocrmarg{3.5em}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \advance\rightskip by 0pt plus 2cm
               \parfillskip -\rightskip \pretolerance=10000
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\renewcommand{\title}{\@dblarg\@@title}
\def\@@title[#1]#2{\gdef\@shorttitle{#1}\gdef\@title{#2}}
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\renewcommand{\author}{\@dblarg\@@author}
\def\@@author[#1]#2{\gdef\@shortauthor{{\let\footnote\@gobble%
   \def\and{\unskip,\ }#1}}\gdef\@author{#2}}
\newcommand{\authorrunning}[1]{%
   \fancyhead[LE]{\hspace{0.05cm}\small\thepage\hspace{5pt}#1}}
\newcommand*{\email}[1]{{\urlstyle{same}\protect\url{#1}}}
\newcommand{\@lnidoi}{}
\newcommand{\lnidoi}[1]{\gdef\@lnidoi{#1}}
\renewcommand\maketitle{\par%
\begingroup
    \renewcommand\thefootnote{\@arabic\c@footnote}%
    \def\@makefnmark% keine Einr??ckung der Fu??noten eingestellt
 {\@textsuperscript{\normalfont\@thefnmark}}%
 \long\def\@makefntext##1{%
 \@setpar{\@@par
 \@tempdima = \hsize
 \advance\@tempdima -1em
 \parshape \@ne 0.15cm \@tempdima}%
 \par\parindent 0.3cm \noindent
 \hb@xt@\z@{\hss\@textsuperscript{\normalfont\@thefnmark}\,}##1}
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}
    \@thanks
  \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \begin{center}%
  \vskip -24pt% Abstand vor dem Titel
  \raggedright % Linksb??ndig
  \let\footnote\thanks
    {\fontsize{14}{17}\selectfont\bfseries\@title\par}%
    \ifx\@subtitle\empty\else
      \vskip 16pt
      {\fontsize{10}{12}\selectfont\bfseries\@subtitle}
    \fi%
    \vskip 19pt% Abstand nach dem Titel
    {\fontsize{10}{12}\selectfont
      \lineskip .5em%
        \@author
      \par}%
    \vskip 28pt% Abstand vor dem Abstract
  \end{center}%
  \AddToShipoutPictureBG*{\AtPageLowerLeft{%
    \put(\LenToUnit{\the\doihoffset},\LenToUnit{\the\doivoffset}){%
      \ifusehyperref
        \href{https://creativecommons.org/licenses/by-nc/3.0/}{\ccbynceu}
      \else
        \ccbynceu
      \fi
      \ifdefempty{\@lnidoi}{}{
        \footnotesize
        \ifusehyperref
          \href{https://doi.org/\@lnidoi}{doi:\@lnidoi}
        \else
          doi:\@lnidoi
        \fi%
      }
    }
  }}
  \par
}%
\renewenvironment*{abstract}{%
 \renewcommand{\abstractname}{Abstract}
 \fontsize{9}{10}\selectfont
    \noindent\ignorespaces{\bfseries\abstractname:\ }%
}{\endquotation}
\newif\ifkeywords
\newenvironment{keywords}%
   {\global\keywordstrue\fontsize{9}{10}\selectfont%
    \def\and{\unskip;\space}%
    \noindent\ignorespaces{\bfseries Keywords:\ }}%
   {\global\keywordsfalse}
\let\@RIGsection\section
\pretocmd\@startsection{\ifkeywords\ClassError{lni}{keywords is an environment, not a macro}%
   {Please change \string\keywords\space to an environment}\keywordsfalse\fi}{}{}
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {-16\p@ \@plus -4\p@ \@minus -4\p@}{5\p@ \@plus 4\p@ \@minus 4\p@}{\fontsize{12}{14}\selectfont\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {-16\p@ \@plus -4\p@ \@minus -4\p@}{8\p@ \@plus 4\p@ \@minus 4\p@}{\fontsize{10}{12}\selectfont\bfseries}}
\setlength{\abovecaptionskip}{4pt}%Abstand vor der Bildunterschrift
\setlength{\belowcaptionskip}{0pt}%Abstand nach der Bildunterschrift
\setlength{\intextsep}{6pt}%Abstand nach der Grafik
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  {\small
   \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi}
  \vskip\belowcaptionskip}
\def\fps@figure{htbp}
\def\fnum@figure{\figurename~\thefigure}
\def\@floatboxreset{%
        \reset@font
        \small
        \@setnobreak
        \@setminipage
}%
\setcounter{topnumber}{10}% maximale Anzahl gleitender Objekte am Seitenanfang
\setcounter{bottomnumber}{10}% maximale Anzahl gleitender Objekte am Seitenende
\renewcommand{\topfraction}{1.0}% Anteil den gleitende Objekte am Seitenanfang einnehmen d??rfen
\renewcommand{\bottomfraction}{1.0}% Anteil den gleitende Objekte am Seitenende einnehmen d??rfen
\def\fps@table{htbp}
\def\fnum@table{\tablename~\thetable}
\renewcommand{\arraystretch}{1.1}%Abstand zu Linien in Tabelle
\renewenvironment{table}
   {\setlength\abovecaptionskip{6\p@}%
    \setlength\belowcaptionskip{0\p@}%
    \@float{table}}%
   {\end@float}%
\renewenvironment{table*}
   {\setlength\abovecaptionskip{6\p@}%
    \setlength\belowcaptionskip{0\p@}%
    \@dblfloat{table}}%
   {\end@dblfloat}%
\setlength{\mathindent}{0.5cm}
\RequirePackage{verbatim}
\def\verbatim@processline{\hskip0.5cm\the\verbatim@line\par}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width 5cm
  \kern2.6\p@}
\newdimen\fnindent
\fnindent0.18cm
\long\def\@makefntext#1{%
    \parindent \fnindent%
    \leftskip \fnindent% Einr??ckung vor der footnotemark
    \noindent
    \llap{\hb@xt@0.10cm{\hss\@makefnmark\ }}\ignorespaces#1}
\setlength{\parindent}{0pt}
\setlength{\parskip}{8pt}
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand*\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
   \setlength{\labelsep}{0.70cm}%Abstand zum Aufz??hlungspunkt
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}%
       \setlength{\itemsep}{8pt}%
       \setlength{\parsep}{-2pt}}%
  \fi}
  \renewcommand{\labelenumii}{\alph{enumii})}
  \renewcommand*\enumerate{%
  \ifnum \@enumdepth >\thr@@
      \@toodeep
    \else
\setlength{\labelsep}{0.70cm}%Abstand zur Aufz??hlungsnummer
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \fi
    \@ifnextchar[{\@enumlabel@{\@enumerate@}[}{\@enumerate@}}
  \def\@enumerate@{%
    \expandafter\list\csname label\@enumctr\endcsname{%
      \usecounter{\@enumctr}%
      \def\makelabel##1{\hss\llap{##1}}
\setlength{\labelsep}{0.6cm} %Einr??ckung des Aufz??hlungszeichens
      \setlength{\itemsep}{8pt}%
      \setlength{\parsep}{-2pt}}
  }%
\newcommand{\andname}{}
\addto\captionsngerman{%
  \renewcommand{\andname}{und}%
  \renewcommand{\figurename}{Abb.}%
  \renewcommand{\tablename}{Tab.}%
  \renewcommand{\lstlistingname}{List.}
  \renewcommand{\refname}{Literaturverzeichnis}
}%
\addto\captionsenglish{%
  \renewcommand{\andname}{and}%
  \renewcommand{\figurename}{Fig.}%
  \renewcommand{\tablename}{Tab.}%
  \renewcommand{\lstlistingname}{List.}
}%
\newcommand*{\startpage}[1]{\setcounter{page}{#1}}
\newcommand*{\@booktitle}{}
\newcommand*{\booktitle}[1]{\renewcommand{\@booktitle}{#1}}
\newcommand*{\@editor}{}
\newcommand*{\editor}[1]{\renewcommand{\@editor}{#1}}
\AtBeginDocument{%
   \let\@rigyear\year
   \newcommand*{\@year}{\the\@rigyear}
   \renewcommand*{\year}[1]{%
      \renewcommand{\@year}{#1}%
   }%
}%
\fancypagestyle{plain}{%
   \fancyhead{} % L??scht alle Kopfzeileneinstellungen
   \fancyhead[RO]{\small\@editor~(Hrsg.):\ \@booktitle,\hspace{1sp}\null\linebreak%
       Lecture Notes in Informatics (LNI), Gesellschaft f??r Informatik, Bonn~\@year%
       \hspace{5pt}\thepage\hspace{0.05cm}}
   \fancyhead[LE]{\small\@editor~(Hrsg.):\ \@booktitle,\linebreak\hspace{0.05cm}\thepage\hspace{5pt} Lecture Notes in Informatics (LNI), Gesellschaft f??r Informatik, Bonn~\@year}
   \fancyfoot{} % L??scht alle Fu??zeileneinstellungen
   \renewcommand{\headrulewidth}{0.4pt} %Linie unter Kopfzeile
}%
\pagestyle{fancy}
\fancyhead{} % L??scht alle Kopfzeileneinstellungen
\fancyhead[RO]{\small\@shorttitle\hspace{5pt}\thepage\hspace{0.05cm}}
\fancyhead[LE]{\hspace{0.05cm}\small\thepage\hspace{5pt}\@shortauthor}
\fancyfoot{} % L??scht alle Fu??zeileneinstellungen
\renewcommand{\headrulewidth}{0.4pt} %Linie unter Kopfzeile
\RequirePackage{url}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\ifusehyperref
   \RequirePackage[pdfusetitle]{hyperref}
   \hypersetup{%
      pdfdisplaydoctitle,
      bookmarks=false,%
      colorlinks=true,%
      allcolors=black,%
      %%%pdfpagelayout=TwoPageRight,%
      pdfstartview=Fit%
   }%
\fi%
\ifusecleveref%
   \iflnienglish
     \usepackage[capitalise,nameinlink]{cleveref}
     \crefname{section}{Sect.}{Sect.}
     \Crefname{section}{Sect.}{Sect.}
   \else
     \usepackage[ngerman,nameinlink]{cleveref}
   \fi%
   \crefname{figure}{\figurename}{\figurename}
   \Crefname{figure}{\figurename}{\figurename}
   \crefname{listing}{\lstlistingname}{\lstlistingname}
   \Crefname{listing}{\lstlistingname}{\lstlistingname}
   \crefname{table}{\tablename}{\tablename}
   \Crefname{table}{\tablename}{\tablename}
\fi%
\RequirePackage[all]{hypcap}
\def\and{\unskip\hspace{-0.42em},\hspace{.6em}}
\ifusebiblatex
\else
   \iflnienglish
      \bibliographystyle{lni}%
   \else
      \bibliographystyle{lnig}%
   \fi%
\fi%
\renewenvironment{thebibliography}[1]
{\iflnienglish\selectlanguage{english}\else\selectlanguage{ngerman}\fi
   \section*{\refname}%
   \bgroup\fontsize{9}{10}\selectfont
   \list{\@biblabel{\@arabic\c@enumiv}}%
   {\settowidth\labelwidth{\@biblabel{#1}}%
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty \clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
{\def\@noitemerr
   {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist\egroup}
\frenchspacing
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty=10000
\displaywidowpenalty=10000
\clubpenalty=9999
\interfootnotelinepenalty=9999
\brokenpenalty=2000
\vfuzz \hfuzz
\raggedbottom
%% 
%% Copyright (C) 2016-2017 by Gesellschaft f??r Informatik e.V. (GI)
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Martin Sievers.
%% 
%% This work consists of the file  lni.dtx
%%                                 lni.ins
%%                                 README.md
%%                                 CHANGELOG.md
%%           and the derived files lni.pdf
%%                                 lni.cls
%%                                 lni-author-template.tex
%%                                 lni.bst
%%                                 lnig.bst
%%
%% End of file `lni.cls'.

%YAML Listings
\newcommand\YAMLcolonstyle{\color{red}}
\newcommand\YAMLkeystyle{\color{black}\small}
\newcommand\YAMLvaluestyle{\color{blue}\small}

\makeatletter
\newcommand\language@yaml{yaml}

\expandafter\expandafter\expandafter\lstdefinelanguage
\expandafter{\language@yaml}
{
  keywords={true,false,null,y,n},
  keywordstyle=\color{darkgray}\ttfamily,
  basicstyle=\YAMLkeystyle\ttfamily,
  sensitive=false,
  comment=[l]{\#},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\YAMLvaluestyle\ttfamily,
  moredelim=[l][\color{orange}]{\&},
  moredelim=[l][\color{magenta}]{*},
  moredelim=**[il][\YAMLcolonstyle{:}\YAMLvaluestyle]{:},   % switch to value style at :
  morestring=[b]',
  morestring=[b]",
  literate =    {---}{{\ProcessThreeDashes}}3
                {>}{{\textcolor{red}\textgreater}}1     
                {|}{{\textcolor{red}\textbar}}1 
                {\ -\ }{{\mdseries\ -\ }}3,
}

\lst@AddToHook{EveryLine}{\ifx\lst@language\language@yaml\YAMLkeystyle\fi}
\makeatother

\newcommand\ProcessThreeDashes{\llap{\color{black}\mdseries-{-}-}}
\definecolor{ListingBackground}{rgb}{0.97,0.97,0.97}

\lstset{frame=none, %snippet config
    language=[Sharp]C,                    %default language
    showstringspaces=false,
    columns=flexible,
    numbers=left,                        %position of numbers
    numberstyle=\tiny\color{gray},
    stringstyle=\color{black},
    backgroundcolor=\color{whitesmoke},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=3,
    basicstyle=\ttfamily\footnotesize,             % font style
    showspaces=false,                        % show space (true, false)
    extendedchars=true,                    % show all Latin1 characters (true, false)
    captionpos=b,                        % sets the caption-position to bottom
    backgroundcolor=\color{ListingBackground},         % source code background
    xleftmargin=10pt,                                % margin left
    xrightmargin=5pt,                                % margin right
    frame=single,                        % border settings
    frameround=ffff,
    rulecolor=\color[rgb]{0.75,0.75,0.75},            % border color
    fillcolor=\color{ListingBackground},
    aboveskip=20pt,
    keywordstyle=\color[rgb]{0.133,0.133,0.6},
    commentstyle=\color[rgb]{0.133,0.545,0.133},
    stringstyle=\color[rgb]{0.627,0.126,0.941}
}