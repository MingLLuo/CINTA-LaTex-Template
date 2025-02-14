%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MingLLuo notes latex styles.
% 
% Usage: 
% \documentclass[letterpaper, anon]{MingLLuo}
% 
% Mainly used for homework and class notes. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CINTA}[2025/02/15 CINTA]

% TODO: Chinese support optimize / comment set
%%%%%%%%%%%%%%%%%%%%%%%%%%%% options %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Author Name
\newif\ifanon
\anonfalse
\DeclareOption{anon}{\anontrue}

% Hides date in top left header
\newif\ifnodate
\nodatefalse
\DeclareOption{nodate}{\nodatetrue}

% Section numbering
\newif\ifrawnumbering
\rawnumberingtrue

\newif\ifsectionnumbering
\sectionnumberingfalse
\DeclareOption{sections}{
    \sectionnumberingtrue
    \subsectionnumberingfalse
    \rawnumberingfalse
}

\newif\ifsubsectionnumbering
\subsectionnumberingfalse
\DeclareOption{subsections}{
    \sectionnumberingfalse
    \subsectionnumberingtrue
    \rawnumberingfalse
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%% preamble %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base class, uses KOMA-Script. 
\LoadClass[parskip]{scrartcl}

% Highlight
\RequirePackage{minted2}
\RequirePackage{minted}
\RequirePackage{tcolorbox}
\tcbuselibrary{listingsutf8}

% Graph 
\RequirePackage{graphicx}

% Tabulars with adjustable-width columns
\RequirePackage{tabularx}
\RequirePackage{longtable}

% Language
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}

% Math
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{aliascnt}
\RequirePackage{amsthm}
\RequirePackage{array}
\RequirePackage{thmtools}

% Metadata
\RequirePackage{titling}
\setlength{\droptitle}{-2cm}
\pretitle{\begin{center}\sffamily\bfseries\LARGE}
\preauthor{\begin{center}
    \large\sffamily \lineskip 0.5em%
    \begin{tabular}[t]{c}}
\predate{\begin{center}\sffamily\large}
\RequirePackage{abstract}
\renewcommand\abstractnamefont{\sffamily}

\ifanon
    \author{}
\else
    \author{Your Name In CINTA.cls}
    \date{\today}
\fi

% Fix titling
\let\settitle\title
\renewcommand{\title}[1]{%
    \settitle{#1}%
    \newcommand{\headertitle}{#1}%
}

% Loads colors
\RequirePackage[dvipsnames]{xcolor}
\newcommand{\accentcolor}{\color{violet}}

\definecolor{darkblue}{RGB}{0, 0, 139}
\definecolor{darkgreen}{RGB}{0, 128, 0}
\definecolor{darkred}{RGB}{178, 34, 34}
\definecolor{gray}{RGB}{128, 128, 128}
\definecolor{black}{RGB}{0, 0, 0}

% Format
\RequirePackage{geometry}
\geometry{
    left=26mm,
    right=26mm,
    top=26mm,
    bottom=26mm,
    headsep=5mm,
}

% For header
\@ifundefined{KOMAClassName}
{
    \usepackage{fancyhdr}
    \setlength{\headheight}{0.75in}
    \setlength{\oddsidemargin}{0in}
    \setlength{\evensidemargin}{0in}
    \setlength{\voffset}{-1.0in}
    \setlength{\headsep}{10pt}
    \setlength{\textwidth}{6.5in}
    \setlength{\headwidth}{6.5in}
    \setlength{\textheight}{8.75in}
    \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
    \setlength{\footskip}{0.3in}
}
{
    \usepackage[headsepline]{scrlayer-scrpage}
    \renewcommand{\headfont}{}
    \setlength{\footskip}{0.5in}
    \setlength{\headsep}{10pt}
    \ifnodate
        \ihead{\footnotesize\textbf{\theauthor}}
    \else
        \ihead{\footnotesize\textbf{\theauthor} (\thedate)}
    \fi
    \automark{section}
    \chead{}
    \ohead{\footnotesize\textbf{\thetitle}}
    \cfoot{\pagemark}
%    \renewcommand{\normalsize}{\fontsize{13}{14}\selectfont} % 设置字体为 15pt，行距为 16pt
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For tables
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.05}

% Underlining
\RequirePackage{soul}

% Graphs
\RequirePackage{tikz}

% Better enumerations
\RequirePackage{enumerate}

% Mathy stuff
\RequirePackage{mathrsfs}
\RequirePackage{textcomp}
\RequirePackage{multirow}
\RequirePackage{mathtools}
\RequirePackage{microtype}
\RequirePackage{stmaryrd}

% Listings (code)
\RequirePackage{listings}
\lstset{
    basicstyle=\small\sffamily,
    numbers=left,
    numberstyle=\tiny,
    frame=tb,
    columns=fullflexible,
    showstringspaces=false
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% environments %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[framemethod=TikZ]{mdframed}
\mdfdefinestyle{mdbluebox}{
    roundcorner = 10pt,
    linewidth=1pt,
    skipabove=12pt,
    innerbottommargin=9pt,
    skipbelow=2pt,
    linecolor=blue,
    nobreak=true,% Page breaking
    backgroundcolor=TealBlue!5,
}
\declaretheoremstyle[
    headfont=\sffamily\bfseries\color{MidnightBlue},
    mdframed={style=mdbluebox},
    headpunct={\\[3pt]},
    postheadspace={0pt}
]{thmbluebox}
\mdfdefinestyle{mdredbox}{
    linewidth=0.5pt,
    skipabove=12pt,
    frametitleaboveskip=5pt,
    frametitlebelowskip=0pt,
    skipbelow=2pt,
    frametitlefont=\bfseries,
    innertopmargin=4pt,
    innerbottommargin=8pt,
    nobreak=true,%Page breaking
    backgroundcolor=Salmon!5,
    linecolor=RawSienna,
}
\declaretheoremstyle[
    headfont=\bfseries\color{RawSienna},
    mdframed={style=mdredbox},
    headpunct={\\[3pt]},
    postheadspace={0pt},
]{thmredbox}
\mdfdefinestyle{mdredboxbreakable}{
    linewidth=0.5pt,
    skipabove=12pt,
    frametitleaboveskip=5pt,
    frametitlebelowskip=0pt,
    skipbelow=2pt,
    frametitlefont=\bfseries,
    innertopmargin=4pt,
    innerbottommargin=8pt,
    nobreak=false,%Page breaking
    backgroundcolor=CarnationPink!5,
    linecolor=Fuchsia,
}
\declaretheoremstyle[
    headfont=\bfseries\color{Fuchsia},
    mdframed={style=mdredboxbreakable},
    headpunct={\\[3pt]},
    postheadspace={0pt},
]{thmredboxexample}
\mdfdefinestyle{mdgreenbox}{
    skipabove=8pt,
    linewidth=2pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=ForestGreen,
    backgroundcolor=ForestGreen!5,
}
\declaretheoremstyle[
    headfont=\bfseries\sffamily\color{ForestGreen!70!black},
    bodyfont=\normalfont,
    spaceabove=2pt,
    spacebelow=1pt,
    mdframed={style=mdgreenbox},
    headpunct={ --- },
]{thmgreenbox}
\mdfdefinestyle{mdblackbox}{%
    skipabove=8pt,
    linewidth=3pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=black,
    backgroundcolor=RedViolet!5!gray!5,
}
\declaretheoremstyle[
    headfont=\bfseries,
    bodyfont=\normalfont\small,
    spaceabove=0pt,
    spacebelow=0pt,
    mdframed={style=mdblackbox}
]{thmblackbox}
\newcommand{\listhack}{$\empty$\vspace{-2em}}

\theoremstyle{definition}
\ifsectionnumbering
    \declaretheorem[style=thmredbox,name=Theorem,numberwithin=section]{theorem}
\fi
\ifsubsectionnumbering
  \declaretheorem[style=thmredbox,name=Theorem,numberwithin=subsection]{theorem}
\fi
\ifrawnumbering
  \declaretheorem[style=thmredbox,name=Theorem]{theorem}
\fi

\declaretheorem[style=thmredbox,name=Lemma,sibling=theorem]{lemma}
\declaretheorem[style=thmredbox,name=Proposition,sibling=theorem]{proposition}
\declaretheorem[style=thmredbox,name=Corollary,sibling=theorem]{corollary}
\declaretheorem[style=thmredbox,name=Theorem,numbered=no]{theorem*}
\declaretheorem[style=thmredbox,name=Lemma,numbered=no]{lemma*}
\declaretheorem[style=thmredbox,name=Proposition,numbered=no]{proposition*}
\declaretheorem[style=thmredbox,name=Corollary,numbered=no]{corollary*}

\declaretheorem[style=thmgreenbox,name=Algorithm,numbered=no]{algorithm*}
\declaretheorem[style=thmgreenbox,name=Claim,sibling=theorem]{claim}
\declaretheorem[style=thmgreenbox,name=Claim,numbered=no]{claim*}

\declaretheorem[style=thmredboxexample,name=Example,sibling=theorem]{example}
\declaretheorem[style=thmredboxexample,name=Example,numbered=no]{example*}

% Remark-style theorems
\declaretheorem[style=thmblackbox,name=Remark,sibling=theorem]{remark}
\declaretheorem[style=thmblackbox,name=Remark,numbered=no]{remark*}

\declaretheorem[style=thmredbox, name=Conjecture,sibling=theorem]{conjecture}
\declaretheorem[style=thmredbox, name=Conjecture,numbered=no]{conjecture*}

\declaretheorem[style=thmbluebox, name=Definition,sibling=theorem]{definition}
\declaretheorem[style=thmbluebox, name=Definition,numbered=no]{definition*}

\declaretheorem[name=Exercise,sibling=theorem]{exercise}
\declaretheorem[name=Exercise,numbered=no]{exercise*}
\declaretheorem[name=Fact,sibling=theorem]{fact}
\declaretheorem[name=Fact,numbered=no]{fact*}
\declaretheorem[name=Problem,sibling=theorem]{problem}
\declaretheorem[name=Problem,numbered=no]{problem*}
\declaretheorem[name=Question,sibling=theorem]{ques}
\declaretheorem[name=Question,numbered=no]{ques*}

% Fancy section and chapter heads
\@ifundefined{KOMAClassName}{}{
    \@ifundefined{chapter}{}{
        \addtokomafont{partprefix}{\rmfamily}
        \renewcommand*{\partformat}{\accentcolor
            \scalebox{2.5}{\thepart}\enlargethispage{2em}}
        \addtokomafont{chapterprefix}{\raggedleft}
        \RedeclareSectionCommand[beforeskip=0.5em]{chapter}
        \renewcommand*{\chapterformat}{\mbox{%
                \scalebox{1.5}{\chapappifchapterprefix{\nobreakspace}}%
                \scalebox{2.718}{\accentcolor\thechapter}\enskip}}
    }
    \renewcommand*{\sectionformat}%
    {\accentcolor\S\thesection\enskip}
    \renewcommand*{\subsectionformat}%
    {\accentcolor\S\thesubsection\enskip}
    \renewcommand*{\subsubsectionformat}%
    {\accentcolor\S\thesubsubsection\enskip}
    \KOMAoptions{numbers=noenddot}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\recall}{\textit{Recall:} }

% Sets of numbers
\newcommand{\CC}{\mathbb C}
\newcommand{\GG}{\mathbb G}
\newcommand{\FF}{\mathbb F}
\newcommand{\NN}{\mathbb N}
\newcommand{\QQ}{\mathbb Q}
\newcommand{\RR}{\mathbb R}
\newcommand{\ZZ}{\mathbb Z}

% MingLLuo
\newcommand{\sampledfrom}{\overset{\$}{\leftarrow}}
\DeclareMathOperator{\Gen}{\mathsf{Gen}}
\DeclareMathOperator{\Enc}{\mathsf{Enc}}
\DeclareMathOperator{\Dec}{\mathsf{Dec}}
\DeclareMathOperator{\Sign}{\mathsf{Sign}}
\DeclareMathOperator{\Mac}{\mathsf{Mac}}
\DeclareMathOperator{\Verify}{\mathsf{Verify}}
\DeclareMathOperator{\negligible}{\mathsf{negligible}}
\newcommand{\eqline}{\noalign{\smallskip} \hline \noalign{\smallskip}}

\DeclareMathOperator{\csimeq}{\overset{c}{\simeq}}

\newcommand{\Graphic}[2]{
    \begin{center}
        \includegraphics[width=#2\textwidth]{#1}
    \end{center}
}

\newcommand{\PPT}{\mathrm{PPT}}

\makeatletter
\def\smallunderbrace#1{\mathop{\vtop{\m@th\ialign{##\crcr
   $\hfil\displaystyle{#1}\hfil$\crcr
   \noalign{\kern3\p@\nointerlineskip}%
   \tiny\upbracefill\crcr\noalign{\kern3\p@}}}}\limits}
\makeatother


% 定义新的层级
\newcommand{\subsubsubsection}[1]{%
  \paragraph{#1}\mbox{}\\
}
\newcommand{\subsubsubsubsection}[1]{%
  \textbf{#1}\mbox{}\\
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional Packages and Customizations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 加载 xeCJK 以支持中文
\RequirePackage{xeCJK}
\RequirePackage{ifplatform}
% 检测操作系统并设置中文字体
\ifwindows
  \setCJKmainfont{SimSun}     % Windows - 宋体
  \setCJKsansfont{SimHei}     % Windows - 黑体
\elifmacos
  \setCJKmainfont{Songti SC}  % macOS - 宋体
  \setCJKsansfont{Heiti SC}   % macOS - 黑体
\fi

% Notes and Margin Notes
\RequirePackage[textsize=tiny, textwidth=18mm]{todonotes}
\setuptodonotes{color=green!20}
\RequirePackage{marginnote}

% Algorithm Environments
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% Redefine todo notes with tikz and marginnote
\makeatletter
\renewcommand{\@todonotes@drawMarginNoteWithLine}{
\begin{tikzpicture}[remember picture, overlay, baseline=-0.75ex]
    \node [coordinate] (inText) {};
\end{tikzpicture}
\marginnote[{% Draw note in left margin
    \@todonotes@drawMarginNote
    \@todonotes@drawLineToLeftMargin
}]{% Draw note in right margin
    \@todonotes@drawMarginNote
    \@todonotes@drawLineToRightMargin
}
}
\makeatother

% Table Footnotes for Framed Environments
\RequirePackage{tablefootnote}
\makeatletter
\AfterEndEnvironment{mdframed}{%
 \tfn@tablefootnoteprintout%
 \gdef\tfn@fnt{0}%
}
\makeatother
\newcommand{\framedfootnote}{\tablefootnote}

% Mathematical Utilities
\RequirePackage{cancel}
\usetikzlibrary{cd}
\numberwithin{equation}{section}

% Diagrams
\RequirePackage[all,cmtip]{xy}

% Custom Footnote Handling
\let\oldFootnote\footnote
\newcommand\nextToken\relax
\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}
\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}

% Cryptography Commands
\RequirePackage[
    n,
    operators,
    advantage,
    sets,
    adversary,
    landau,
    probability,
    notions,    
    logic,
    ff,
    mm,
    primitives,
    events,
    complexity,
    asymptotics,
    keys
]{cryptocode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of Additional Modules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%