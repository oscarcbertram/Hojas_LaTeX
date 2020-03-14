% ---------------------------------------------------------------------
% Conference proceedings and article templates for
% personal open-archiving activities
% September 2012
% ---------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SelfArx}[25/01/2012, v1.0]
\RequirePackage{ifthen}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}

\RequirePackage{times}      % Loads the Times-Roman Fonts
\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts
\RequirePackage{ifpdf}      % Needed to pick between latex and pdflatex

% ---------------------------------------------------------------------
\RequirePackage[utf8, latin1]{inputenc}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage[spanish, english]{babel}
\RequirePackage{booktabs}
% ---------------------------------------------------------------------


% Cambiar nombres a los encabezados
%\renwecommand{\contentsname}{\'Indice}

%%%%% for abstract+authors frames 


% ---------------------------------------------------------------------		  
% margins		  
\RequirePackage[left=1.8cm,%
                right=1.8cm,%
				top=2.25cm,%
				bottom=2.25cm,%
				headheight=11pt,%
				a4paper]{geometry}%
\RequirePackage[labelfont={bf,sf},%
                labelsep=period,%
                justification=raggedright]{caption}
% ---------------------------------------------------------------------
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\lhead{}%
\chead{}%
\rhead{\small\sffamily\bfseries\@PaperTitle\  --- \thepage/\pageref{LastPage}}
% Footers
\lfoot{\sc UPM}%
\cfoot{}%
\rfoot{Oscar Cabrero Bertram}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule
% ---------------------------------------------------------------------
% section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{color1}\Large\bfseries}
  {}
  {0em}
  {\colorbox{color2!50}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\Large\bfseries}
  {}
  {0em}
  {\colorbox{color2!50}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering#1}}}
  []  
\titleformat{\subsection}
  {\color{color1}\large\bfseries}
  {\thesubsection}
  {0.5em}
  {\parbox{\dimexpr\linewidth}{#1}}
  []
\titleformat{\subsubsection}
  {\bfseries\large}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{8pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{5pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{5pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}
% ---------------------------------------------------------------------
% tableofcontents set-up
\usepackage{titletoc}
\contentsmargin{0.1cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\small}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize}
  {}
  {}
  {}
  [\ \textbullet\ ]  
% ---------------------------------------------------------------------  
% Get the multiple author set
\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
   \let\next\@affiliation \vskip1pt
  \else
   \let\next\relax
  \fi
\next}
	 
\newcommand{\affiliation}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}
% ---------------------------------------------------------------------
\RequirePackage{enumitem}
%\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)
% ---------------------------------------------------------------------
% Remove brackets from numbering in List of References
%\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}}
%\setlength{\bibitemsep}{0cm}
% ---------------------------------------------------------------------
\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Archive}[1]{\def\@Archive{#1}}
\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\JournalInfo}[1]{\def\@JournalInfo{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{\em #1}}
\newcommand{\Resumen}[1]{\def\@Resumen{\em #1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}


% ---------------------------------------------------------------------
\renewcommand{\@maketitle}{%
\twocolumn[{%
\thispagestyle{empty}%
%\vskip-36pt%
%{\raggedleft\bfseries\@JournalInfo\\\@Archive\par}%
\vskip10pt%
{\centering\color{color1}\bfseries\scshape\fontsize{20}{20}\selectfont\@PaperTitle\par}%
\vskip10pt
{\centering\color{color1}\fontsize{15}{20}\selectfont\@Authors\par}
\vskip18pt%
\fcolorbox{black}{white}{%
\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
\colorbox{color2!50}{%
\parbox{\textwidth-3.5\fboxsep-3.5\fboxrule}{%
\ifx\@Keywords\@empty
\centering\textbf{\textit{\resumenname}}\\\@Resumen
\centering\textbf{\textit{\abstractname}}\\\@Abstract
\else
\centering\textbf{\textit{\nombreresumen}}\\\raggedright\@Resumen\\
\dotfill\\
\centering\textbf{\textit{\abstractname}}\\\raggedright\@Abstract\\[5pt]%
\raggedright\textbf{\keywordname}\\\@Keywords%
\fi
}%
}%
\vskip5pt%
\begingroup%
\raggedright\sffamily\small%
\footnotesize\@affiliation\par%
\endgroup%%
}%
}%
\vskip25pt%
}]%
}%
% ---------------------------------------------------------------------

\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
\addcontentsline{toc}{section}{\hspace*{-\tocsep}\refname}%
\oldbibliography{#1}%
\setlength\itemsep{0pt}%
}