%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MingLLuo notes latex styles.
% 
% Usage: 
% \documentclass[letterpaper, anon]{CINTA}
% 
% Mainly used for homework and class notes. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CINTA}[2025/02/19 CINTA]
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
    \sectionnumberingtrue  % Activate section numbering
    \subsectionnumberingfalse  % Disable subsection numbering
    \rawnumberingfalse  % Disable raw numbering
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

\ifanon
    \author{}
\else
    \author{MingLLuo}
    \date{\today}
\fi

% Fix titling
\let\settitle\title
\renewcommand{\title}[1]{%
    \settitle{#1}%
    \newcommand{\headertitle}{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% preamble %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base class, uses KOMA-Script. 
\LoadClass[parskip]{scrartcl} % Load the scrartcl class with paragraph skip option

% https://tex.stackexchange.com/questions/58087/how-to-remove-the-warnings-font-shape-ot1-cmss-m-n-in-size-4-not-available
\RequirePackage{ctex}  % Support for Chinese typesetting
\RequirePackage{lmodern}  % Latin Modern font package
\RequirePackage{anyfontsize}  % Allows any font size

% Highlight
\RequirePackage{minted2}  % Package for highlighting source code
\RequirePackage{minted}  % Additional highlighting package
\RequirePackage{tcolorbox}  % For creating colored boxes

% Graph 
\RequirePackage{graphicx}  % For handling images


% Tabulars with adjustable-width columns
\RequirePackage{tabularx}
\RequirePackage{longtable}

% Language
\RequirePackage[english]{babel}  % Support for English language
\RequirePackage[T1]{fontenc}  % Font encoding
\RequirePackage{microtype}  % Fine-tuned typographic adjustments

% Math
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{aliascnt}
\RequirePackage{amsthm}
\RequirePackage{array}  % Better array support
\RequirePackage{thmtools}  % Tools for theorem formatting

% Metadata
\RequirePackage{titling}  % Custom title formatting
\setlength{\droptitle}{-2cm}  % Drop the title by 2cm
\pretitle{\begin{center}\sffamily\bfseries\LARGE}  % Title formatting
\preauthor{\begin{center} \large\sffamily \lineskip 0.5em \begin{tabular}[t]{c}}  % Author formatting
\predate{\begin{center}\sffamily\large}  % Date formatting

\RequirePackage{abstract}  % Abstract environment
\renewcommand\abstractnamefont{\sffamily}  % Abstract name font

% Loads colors
\RequirePackage[dvipsnames]{xcolor}  % Color support with predefined names
\newcommand{\accentcolor}{\color{violet}}  % Custom accent color

\definecolor{darkblue}{RGB}{0, 0, 139}  % Custom colors
\definecolor{darkgreen}{RGB}{0, 128, 0}
\definecolor{darkred}{RGB}{178, 34, 34}
\definecolor{gray}{RGB}{128, 128, 128}
\definecolor{black}{RGB}{0, 0, 0}

% Format
\RequirePackage{geometry}  % Set page layout
\geometry{
    left=26mm,
    right=26mm,
    top=26mm,
    bottom=26mm,
    headsep=5mm,  % Margin and header spacing
}

% For header
\@ifundefined{KOMAClassName}
{
    \usepackage{fancyhdr}  % Fancy headers if KOMA class is undefined
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
    \usepackage[headsepline]{scrlayer-scrpage}  % For KOMA-Script header configuration
    \renewcommand{\headfont}{}
    \setlength{\footskip}{0.5in}
    \setlength{\headsep}{10pt}
    \ifnodate
        \ihead{\footnotesize\textbf{\theauthor}}  % Author on the left header if no date
    \else
        \ihead{\footnotesize\textbf{\theauthor} (\thedate)}  % Author and date on the left header
    \fi
    \automark{section}  % Automatically mark sections in header
    \chead{}
    \ohead{\footnotesize\textbf{\thetitle}}  % Title on the right header
    \cfoot{\pagemark}  % Page number at the footer
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For tables
\RequirePackage{booktabs}  % Better table formatting
% \renewcommand{\arraystretch}{1.05}  % Increase space between rows in tables

% For links
\RequirePackage[
    colorlinks = true,
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = blue,
    anchorcolor = blue,
    destlabel = true]{hyperref}  % Hyperlinks with blue color

% Underlining
\RequirePackage{soul}  % Support for underlined text

% Graphs
\RequirePackage{tikz}  % For creating graphics

% Better enumerations
\RequirePackage{enumerate}  % Better control over list formatting

% Mathy stuff
\RequirePackage{mathrsfs}
\RequirePackage{textcomp}
\RequirePackage{multirow}
\RequirePackage{mathtools}
\RequirePackage{microtype}
\RequirePackage{stmaryrd}

% Mathy stuff
\RequirePackage{mathrsfs}  % Mathematical calligraphic fonts
\RequirePackage{textcomp}  % Text symbols
\RequirePackage{multirow}  % Tables with multiple rows
\RequirePackage{mathtools}  % Enhances math tools
\RequirePackage{microtype}  % Fine typography adjustments
\RequirePackage{stmaryrd}  % Symbols for math logic

%%%%%%%%%%%%%%%%%%%%%%%%%%%% environments %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[framemethod=TikZ]{mdframed}  % For framed environments using TikZ
\mdfdefinestyle{mdbluebox}{
    roundcorner = 10pt,
    linewidth=1pt,
    skipabove=12pt,
    innerbottommargin=9pt,
    skipbelow=2pt,
    linecolor=blue,
    nobreak=true,  % Prevent page breaking inside box
    backgroundcolor=TealBlue!5,
}  % Style for blue box around text
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

% 格式自动适应
\RequirePackage[nameinlink]{cleveref} 
\Crefname{claim}{Claim}{Claims}
\Crefname{conjecture}{Conjecture}{Conjectures}
\Crefname{exercise}{Exercise}{Exercises}
\Crefname{fact}{Fact}{Facts}
\Crefname{problem}{Problem}{Problems}
\Crefname{ques}{Question}{Questions}

% Fancy section and chapter heads configuration using KOMA-Script
\@ifundefined{KOMAClassName}{}{
    \@ifundefined{chapter}{}{ % If chapters are supported, configure part and chapter formatting
        \addtokomafont{partprefix}{\rmfamily} % Set the font of the part prefix to roman
        \renewcommand*{\partformat}{\accentcolor
            \scalebox{2.5}{\thepart}\enlargethispage{2em}} % Redefine part format: scale the part number and add an accent color, also extend the page height slightly
        \addtokomafont{chapterprefix}{\raggedleft} % Set the chapter prefix font to be right-aligned (ragged left)
        \RedeclareSectionCommand[beforeskip=0.5em]{chapter} % Re-declare the chapter command with a pre-skip of 0.5em
        \renewcommand*{\chapterformat}{\mbox{%
                \scalebox{1.5}{\chapappifchapterprefix{\nobreakspace}}%
                \scalebox{2.718}{\accentcolor\thechapter}\enskip}} % Redefine chapter format: scale the chapter app and number, applying accent color
    }
    \renewcommand*{\sectionformat}%
    {\accentcolor\S\thesection\enskip} % Define section format: use an accent color, a section symbol, and the section number
    \renewcommand*{\subsectionformat}%
    {\accentcolor\S\thesubsection\enskip} % Define subsection format similarly
    \renewcommand*{\subsubsectionformat}%
    {\accentcolor\S\thesubsubsection\enskip} % Define subsubsection format similarly
    \KOMAoptions{numbers=noenddot} % Set KOMA option to remove the trailing dot in numbered headings
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

% Define a custom small underbrace command using low-level TeX commands
\makeatletter
\def\smallunderbrace#1{\mathop{\vtop{\m@th\ialign{##\crcr
   $\hfil\displaystyle{#1}\hfil$\crcr
   \noalign{\kern3\p@\nointerlineskip}%
   \tiny\upbracefill\crcr\noalign{\kern3\p@}}}}\limits}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional Packages and Customizations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Notes and Margin Notes
\RequirePackage[textsize=tiny, textwidth=18mm]{todonotes}
\setuptodonotes{color=green!20} % Set the default color for todo notes to a light green
\RequirePackage{marginnote} % Load the marginnote package to allow notes in the margin

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
\RequirePackage{tablefootnote} % allow footnotes inside table and framed environments
\makeatletter
\AfterEndEnvironment{mdframed}{%
 \tfn@tablefootnoteprintout% Automatically print table footnotes after an mdframed environment
 \gdef\tfn@fnt{0}% Reset the table footnote counter
}
\makeatother
\newcommand{\framedfootnote}{\tablefootnote} % Define an alias for tablefootnote as \framedfootnote

% Mathematical Utilities
\RequirePackage{cancel} % striking out parts of equations
\usetikzlibrary{cd} % Load TikZ library for commutative diagrams
\numberwithin{equation}{section} % Number equations within sections (e.g., 2.1, 2.2, etc.)

% Diagrams
\RequirePackage[all,cmtip]{xy}

% Custom Footnote Handling
\let\oldFootnote\footnote % Save the original \footnote command
\newcommand\nextToken\relax % Define a temporary command to hold the next token
\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote} % Redefine \footnote to check if another footnote follows immediately
\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi} % If the next token is also a footnote, insert a comma in superscript

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
