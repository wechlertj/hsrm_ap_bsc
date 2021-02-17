\NeedsTeXFormat{LaTeX2e}
\LoadClass[%
  paper=A4,               % paper size --> A4 is default in Germany
  onesite,           % onesite or twoside printing
  openright,                % doublepage cleaning ends up right side
  parskip=half,           % spacing value / method for paragraphs
  %chapterprefix=true,     % prefix for chapter marks
  12pt,                   % font size
  headings=normal,        % size of headings
  bibliography=totoc,     % include bib in toc
  listof=totoc,           % include listof entries in toc
  titlepage=on,           % own page for each title page
  captions=tableabove,    % display table captions above the float env
  chapterprefix=false,    % do not display a prefix for chapters
  appendixprefix=false,    % but display a prefix for appendix chapter
  draft=false,            % value for draft version
  numbers=noenddot
]{scrreprt}
\ProvidesClass{hsrmreport}[2020/03/29 Class file for homework assignments]


% **************************************************
% Packages (https://www.namsu.de/Extra/latex-pakete.html)
% **************************************************
	\RequirePackage{xpatch}
	\RequirePackage{xkeyval}				%
	\RequirePackage{xifthen}				% Für die Möglichkeit If-Abfragen zu erstellen (http://ctan.ebinger.cc/tex-archive/macros/latex/contrib/xifthen/xifthen.pdf)
	
	% ---------------------------
	% Definition aller Optionen 
	% für diese Klasse
	% ---------------------------

		\DeclareOptionX*{
			\PackageWarning{hsrm}{Unknown option '\CurrentOption'}%
		}

		\ProcessOptionsX[hsrm]<hsrm>
	%
%
% **************************************************
% Color Definitions
% **************************************************
	% Ermöglicht das Nutzen von Farben zum Beispiel farbige Schrift. 
	\RequirePackage[dvipsnames]{xcolor}
	\RequirePackage{tikz}
	\RequirePackage{circuitikz}
	%\usetikzlibrary{calc,decorations,decorations.pathmorphing,arrows,matrix,positioning,patterns}	
	% ---------------------------
	% Definition aller Farben
	% ---------------------------
	%\definecolor{black}{gray}{0}
	\definecolor{gray}{cmyk}{0,0,0,.8}
	\definecolor{red}{cmyk}{0,1,1,0}
	\definecolor{reddark}{cmyk}{0,1,.9,.41}
	\definecolor{graylight}{gray}{.8}
	\definecolor{graylighter}{gray}{.95}
	% sets all colors (like colorize == full)
	% -- footer colors
	\colorlet{ctcolorfooterpage}{black}
	\colorlet{ctcolorfooterline}{gray}
	\colorlet{ctcolorfootermark}{black}
	\colorlet{ctcolorfootertitle}{gray}
	% -- sectioning colors
	\colorlet{ctcolortitle}{black}
	\colorlet{ctcolorpartnum}{black}
	\colorlet{ctcolorpartline}{black}
	\colorlet{ctcolorparttext}{black}
	\colorlet{ctcolorchapternum}{gray}
	\colorlet{ctcolorchapterline}{black}
	% --> text colors
	\colorlet{ctcolorfloatlabel}{gray}
	\colorlet{ctcolorlistlabel}{black}
	%Code List Farben
	\definecolor{bluekeywords}{cmyk}{0.56, 0.6, 0,.24}
	\definecolor{greencomments}{cmyk}{.22, 0, .38, .24}
	\definecolor{redstrings}{cmyk}{0,.52,.48,.12}
	\definecolor{graynumbers}{cmyk}{.23,.15,0,.8}

%
% **************************************************
% Sprachen und Schrift
% **************************************************
	
	\RequirePackage[utf8]{inputenc}				% Wird für die direkte Eingabe von Umlauten gebraucht.
	\RequirePackage[T1]{fontenc}				% Trennung von Umlauten.
	\RequirePackage[ngerman]{babel}				% Eine Sammlung von verschieden Sprachen, und ermöglicht für diese Sprachen die automatische Worttrennung und die ändert die Bezeichnungen in die jeweilige Sprache. 
												% [ngerman]: Worttrennung nach der neuen Rechtschreibung und deutsche Bezeichnungen. 
	\RequirePackage{datetime}
	\RequirePackage[ngerman]{varioref}			% Sorgt für intelligente Querverweise (http://texdoc.net/texmf-dist/doc/latex/tools/varioref.pdf)
												% [ngerman]: neue deutsche Rechtschreibung 
	\RequirePackage{lmodern}					% Schriftart (http://www.tug.dk/FontCatalogue/)
	\RequirePackage{scrhack}
	\RequirePackage{cancel}						% Text durchsteichen 
	\RequirePackage{ulem}						% Text durchsteichen
	\RequirePackage[right]{eurosym} 			% Ermöglicht das nutzen von \EUR{-Betrag-} (http://www.theiling.de/eurosym.html)
												% [right]: Positionierung des Eurossymbol rechts des Betrags 
	\RequirePackage{blindtext}					% Platzhalter Text (https://ctan.mc1.root.project-creative.net/macros/latex/contrib/blindtext/blindtext.pdf)
	\RequirePackage{textcomp}
	\RequirePackage{gensymb}					% Allgemeine Symole für Text und Mathematik (http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/was/gensymb.pdf)
	\RequirePackage{microtype}					% typographic tuning (http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/ctan/macros/latex/contrib/microtype/microtype.pdf)
	\RequirePackage{setspace}
	\RequirePackage[							% (https://www.namsu.de/Extra/pakete/Siunitx.html)
		locale=DE,
		%per-mode=symbol
		per-mode = fraction
	]{siunitx} 	
	\RequirePackage[							% advanced quotes (https://ctan.net/macros/latex/contrib/csquotes/csquotes.pdf)
		strict=true,							% 	- warning are errors now
		style=german							% 	- german quotes
	]{csquotes}
	%
	% ---------------------------
	% Textformatierung
	% ---------------------------
		%\setstretch{1.2}					% value for line spacing, use \setstretch{} or \singlespacing or \onehalfspacing or \doublespacing
		\setlength{\parindent}{0em}			% value for paragraph indentation
		\clubpenalty = 10000				% prevent single lines at the beginning of a paragraph (Schusterjungen)
		\widowpenalty = 10000				% prevent single lines at the end of a paragraph (Hurenkinder)
		\displaywidowpenalty = 10000		%
		% own font definitions
					
		\newcommand{\fontfooterpagenumber}{%
		    \color{ctcolorfooterpage}%
		    \normalfont\normalsize\bfseries\selectfont%
		}
		\newcommand{\fontfootertext}{%
		    \color{ctcolorfootertitle}%
		    \normalfont\footnotesize\selectfont%
		}
		%
		% Inhaltsverzeichnis Tiefe bis zu SubSection
		\setcounter{secnumdepth}{\subsectionnumdepth}

	%
	% ---------------------------
	% Abschnitte Formatieren
	% ---------------------------
		% -- modifications regarding sectioning (structural) commands,
		%    i.e. \part, \chapter, \section, \subsection, \subsubsection, \paragraph
		%
		% [font]: 	die Foramtierung die man im Fließtext sieht
		% [toc...]: alles was den Prefix "toc" hat betrifft das Inhaltsverzeichnis.
		% 			Diese Angaben sind wichtig da sie andere Standardwerte haben. 
		%			Möchte man den Standard von der KOMA-Klasse einfach die Einträge auskommentieren.
		%
		% > formats: \part
			\renewcommand*{\partpagestyle}{empty}
			\RedeclareSectionCommand[
				font=\normalfont\Huge,
				tocindent=0pt,
				prefixfont=\fontfamily{pbk}\fontseries{m}\fontsize{80}{80}\selectfont,
				%tocnumwidth=1.5em, 							% - stellt sicher das Kapitel und Teil in einer Flucht sind
				tocentryformat=\fontseries{m}\Large\selectfont,
				tocpagenumberformat=\fontseries{m}\Large\selectfont,
				expandtopt,
				innerskip=-0.6\baselineskip
			]{part}
			\renewcommand*{\partformat}{%
				\tikz[remember picture]\node[inner ysep=-0.4em,inner xsep=0.3em](partnumber)
					{\raisebox{.7em}{\MakeUppercase{\partname}\nobreakspace \fontsize{120}{120}\selectfont{\thepart\autodot}}};%	
			}
			\xapptocmd{\partheadstartvskip}{%
				\Ifunnumbered{part}
					{\tikz[remember picture]\coordinate(partstart);\\*[1.5\baselineskip]}
					{}%
				}{}{}
			\xpretocmd{\partheadendvskip}{%
				\vspace*{.5\baselineskip}%
				\noindent\Ifnumbered{part}
					{\tikz[remember picture,overlay]\draw(partnumber)-|(0,0)--+(\textwidth,0)|-(partnumber);}
					{\tikz[remember picture,overlay]\draw(partstart)-|(0,0)--+(\textwidth,0)|-(partstart);}%
				}{}{}

				
		%
		% > formats: \chapter
			\RedeclareSectionCommand[
				font=\normalfont\huge\selectfont,
				tocnumwidth = 2em,
				tocentryformat=\normalfont\bfseries\large\selectfont
			]{chapter}
			\renewcommand*\chapterheadstartvskip{\vspace*{-8.5em}}
			\renewcommand*\chapterheadendvskip{\vspace*{2\baselineskip}}
			\renewcommand*{\chapterformat}{%
				\chapternumber{\thechapter}%
			}
			\renewcommand{\chapterlinesformat}[3]{%
				\chaptertitle{#3}%
				#2\par%
			}

			\newcommand{\chapternumber}[1]{%
				\usekomafont{chapter}%
				\begin{minipage}[t]{0.3\textwidth}%
					\raggedleft{%
						{\vspace*{-0.5cm}\color{ctcolorchapterline}\rule[-5pt]{2pt}{5.5cm}}%
						\quad%
						{\color{ctcolorchapternum}\fontsize{60}{60}\selectfont\textbf{#1}}%
					}%
				\end{minipage}%
			}
			\newcommand{\chaptertitle}[1]{%
				\usekomafont{chapter}%
				\begin{minipage}[t]{0.7\textwidth}%
					\vspace*{5.85em}%
					\raggedright%
					#1%
				\end{minipage}%
			}
		%
		% > formats: \section
			\RedeclareSectionCommand[
				font=\normalfont\LARGE\selectfont,
				tocindent =2em,
				tocentryformat=\normalfont\selectfont
			]{section}
		%
		% > formats: \subsection
			\RedeclareSectionCommand[
				font=\normalfont\Large\selectfont,
				tocindent = 4.25em,
				tocentryformat=\normalfont\small\selectfont
			]{subsection}
		%
		% > formats: \paragraph
			\RedeclareSectionCommand[
				font=\bfseries\small\selectfont
			]{paragraph}
		%
	%
%
% **************************************************
% Grafiken und Bilder
% **************************************************
	\RequirePackage[							% modify figure and table captions
		font={small}, 							% 	- small font size
		labelfont={footnotesize,sf,bf},			% 	- 
		textfont={footnotesize,sf},
		labelsep=colon,							% 	- separator: none, colon, period, space, quad, newline, endash
		singlelinecheck=false,					% 	- no centered single-lined captions
		justification=centering
	]{caption}
	\RequirePackage{graphicx}					% Das Standardpaket zum Einbinden von Bildern / Grafiken. 
	\RequirePackage{wrapfig}					% Mit oder von Schrift umflossen Bilder.
	\RequirePackage[ 							% für die Unterbilder %---------
		font={scriptsize,sl},
		captionskip=3pt
	]{subfig}
%
% **************************************************
% Tabellen
% **************************************************
	\RequirePackage{tabularx}					% Tabellen mit automatischen Zeilenumbruch.
	\RequirePackage{tabulary}					% Ähnlich wie tabularx, ermöglicht aber das ändern der Ausrichtung der Spalten.
	\RequirePackage{booktabs}					% Schöne Tabellen beziehungsweise sie sehen damit professioneller aus. 
	\RequirePackage{array}
	\RequirePackage{multirow}
	\RequirePackage{multicol}
	\RequirePackage{longtable}					% Tabellen über mehrere Seiten (https://www.namsu.de/Extra/pakete/Longtable.html)

% 
% **************************************************
% Listen
% **************************************************
	\RequirePackage{enumitem}					% for simple list modifications
	\RequirePackage[german,intoc]{nomentbl} 	%vier Spalten bei Formelzeichenverzeichnis (http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/ctan/macros/latex/contrib/nomentbl/nomentbl.pdf)		
	%				
	% ---------------------------
	% Textformatierung
	% ---------------------------
	%
% 
% **************************************************
% Aussehen und Gestaltung von Dokumenten
% **************************************************
	\RequirePackage{geometry}
	\RequirePackage{forest}
	\RequirePackage{scrlayer-scrpage}  
	\RequirePackage{setspace}					% Um den Zeilenabstand zu ändern, e.g. \onehalfspacing
	\RequirePackage[hyphens]{url}
	\appto\UrlBreaks{\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z}
	\appto\UrlBreaks{\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z}
	\appto\UrlBreaks{\do\/\do\_}
	\RequirePackage[						
		pdftitle={titel},    					%   - title (PDF meta)
		pdfsubject={dokumentenart},				%   - subject (PDF meta)
		pdfauthor={autor},    					%   - author (PDF meta)
		plainpages=false,           			%   -
		colorlinks=true,           				%   - farbige Links
		linkcolor={black},
		anchorcolor={black},
		citecolor={greencomments},
		filecolor={redstrings},
		menucolor={black},
		runcolor={redstrings}, 					%	- same as file color
		urlcolor={redstrings},
		%allcolors=any_color					%	- use this if you want to set all links to the same color
		pdfborder={0 0 0},         	 			%   - 
		breaklinks=true,            			%   - allow line break inside links
		linktoc=all,							% 	- ermöglicht klickbare Links im Inhaltsverzeichnis
		bookmarksnumbered=true,     			%	- 
		bookmarksopen=true          			%	- 
	]{hyperref} 								% Erstellt Verweise innerhalb und nach außerhalb eines PDF Dokumentes.
	\RequirePackage{bookmark}
	\RequirePackage{makeidx}					% Anlegen eines Stichwortverzeichnis.
	\RequirePackage{parallel}					% Ermöglicht Text in mehreren Spalten nebeneinander zu stellen (https://texfaq.org/FAQ-parallel)
	\RequirePackage[
		nonumberlist, 							% keine Seitenzahlen anzeigen
		acronym,      							% ein Abkürzungsverzeichnis erstellen
		toc,          							% Einträge im Inhaltsverzeichnis
		section      							% im Inhaltsverzeichnis auf section-Ebene erscheinen
	]{glossaries}
	\RequirePackage[
		record,
		stylemods,
		style=listgroup
	]{glossaries-extra}
	\RequirePackage{tablefootnote}				% Für Fußnoten (http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/ctan/macros/latex/contrib/tablefootnote/tablefootnote.pdf)
	
	% ---------------------------
	% Weitere Einstellungen für den Seitenaufbau
	% ---------------------------
		\clearscrheadfoot
		\geometry{
			%showframe, % <========================================================
			tmargin=25mm,        % top    
			rmargin=25mm,       % right (outer)
			heightrounded,
			includeheadfoot=false,
			inner=25mm,
			outer=25mm,
			headheight=7mm,     % 
			headsep=9mm,        % 
			foot=40pt,          %
			footskip=40mm,
			bottom=25mm,
			marginparsep=2mm,   % 
			marginparwidth=18mm % 
		}
	%
	% ---------------------------
	% Header Footer Definition
	% ---------------------------
		\automark[section]{chapter}         % automatically marks sections as rightmark
		% and chapters as leftmark
		\setlength{\footheight}{80pt}
		\pagestyle{scrheadings}
			% the outer border
		\setkomafont{pagefoot}{\fontfootertext}           % font for footer
		\setkomafont{pagenumber}{\fontfooterpagenumber}   % font for page numbers

		%% Redefinition of the chaptermark (used for footer mark on even (left) pages)
		\renewcommand{\chaptermark}[1]{%
			\markboth{%
			\ifnum\value{chapter}>0
				\fontfootertext
				% use \@chapapp instead of \chaptername to avoid
				% 'Chapter A Appendix ...', thanks to @farbverlust (issue #47)
				{\color{ctcolorfootermark}\textbf{\@chapapp\ \thechapter}}%
				\hspace{.25cm}%
				\protect\begin{minipage}[t]{.65\textwidth}%
					#1%
				\protect\end{minipage}%
			\fi
			}{}%
		}

		%% Redefinition of the sectionmark (used for footer mark on odd (right) pages)
		\renewcommand{\sectionmark}[1]{%
			\markright{%
			\ifnum\c@secnumdepth>\@ne
					\fontfootertext
					\protect\raggedleft%
					{\color{ctcolorfootermark}\textbf{\thesection}}%
				\hspace{.25cm}%
				\protect\begin{minipage}[t]{\minof{\widthof{#1}}{.7\textwidth}}%
					#1%
				\protect\end{minipage}%			
			\fi
			}%  
		}

		%% Vertical line in the footer (between page number and mark)
		\newcommand{\footerline}{%
			\color{ctcolorfooterline}\rule[-35pt]{1.25pt}{45pt}%
		}
		%% Page number for odd (right) pages
		\newcommand{\footerrightpagenumber}{%
			\hfill {\footerline\hspace*{5pt} \pagemark}
		}

		%% Page number for even (left) pages
		\newcommand{\footerleftpagenumber}{%
			\hfill {\footerline\hspace*{5pt} \pagemark}
			%\llap{\pagemark\hspace*{5pt}\footerline}
		}


		%\lehead[\clearscrheadfoot]{\rightmark}
		
		\lohead[\clearscrheadfoot]{\leftmark}

		
		\refoot[\footerrightpagenumber]{\footerrightpagenumber} 
		\rofoot[\footerrightpagenumber]{\footerleftpagenumber}
		
		
		
	%
% 
% **************************************************
% Mathematik
% **************************************************
	\RequirePackage{amsmath} 					% abgesetzte Formeln zentriert in der Zeile
	\RequirePackage{amssymb} 					
	\RequirePackage{amsfonts}
%
% **************************************************
% Bibliography
% **************************************************
	\RequirePackage[					% use biblatex for bibliography
		backend=biber,					% 	- use biber backend (bibtex replacement) or bibtex
		style=alphabetic,				% 	- use alphabetic (or numeric) bib style
		natbib=true,					% 	- allow natbib commands
		hyperref=true,					% 	- activate hyperref support
		backref=true,					% 	- activate backrefs
		isbn=false,						% 	- don't show isbn tags
		url=false,						% 	- don't show url tags
		doi=false,						% 	- don't show doi tags
		urldate=long,					% 	- display type for dates
		maxnames=3,%
		minnames=1,%
		maxbibnames=5,%
		minbibnames=3,%
		maxcitenames=2,%
		mincitenames=1,%,
		sorting=nty,%
		block=ragged,% point 5
	]{biblatex}
	%\bibliography{bib-refs}
	\DefineBibliographyStrings{ngerman}{%
		andothers = {{et\,al\adddot}}, % 'et al.' instead of 'u.a.'
		backrefpage = {{zitiert auf Seite}},%
		backrefpages = {{zitiert auf den Seiten}},%
	}



%
% **************************************************
% New Commands
% **************************************************
	% TODO command
	\definecolor{color_todo}{rgb}{.6,.8,.2}
	\newcommand{\todo}[1]{{\color{color_todo}\textbf{[TODO #1]}}}
	%
	%
	% ref commands, e.g. for images, tables and text labels
	% --------------------------------------------------
	% RESULT = (siehe Tab. 12.4)
	\newcommand{\tabref}[1]{(siehe Tab.~\ref{#1})}
	%
	% RESULT = (siehe Tab. 12.4 Seite 12)
	\newcommand{\tableref}[1]{(siehe Tab.~\ref{#1} Seite~\pageref{#1})}
	%
	% --------------------------------------------------
	% RESULT = (siehe 3.4)
	\newcommand{\tref}[1]{(siehe \ref{#1})}
	%
	% RESULT = Abschnitt 3.4
	\newcommand{\treft}[1]{Abschnitt~\ref{#1}}
	%
	% RESULT = (siehe 3.4, Seite 12)
	\newcommand{\textref}[1]{(siehe \ref{#1}, Seite~\pageref{#1})}
	%
	% RESULT = Abschnitt 3.4 (siehe Seite 12)
	\newcommand{\textreft}[1]{Abschnitt~\ref{#1} (siehe Seite~\pageref{#1})}
	%
	% --------------------------------------------------
	% RESULT = (siehe Abb. 10.4)
	\newcommand{\fref}[1]{(siehe Abb.~\ref{#1})}
	%
	% RESULT = (siehe Abb. 10.4 b)
	\newcommand{\frefadd}[2]{(siehe Abb.~\ref{#1}~#2)}
	%
	% RESULT = (siehe Abb. 10.4, Seite 12)
	\newcommand{\figref}[1]{(siehe Abb.~\ref{#1}, Seite~\pageref{#1})}
	%
	% RESULT = (siehe Abb. 10.4 b, Seite 12)
	\newcommand{\figrefadd}[2]{(siehe Abb.~\ref{#1}~#2, Seite~\pageref{#1})}
	%
	% RESULT = Abbildung 10.4
	\newcommand{\figreft}[1]{Abbildung~\ref{#1}}
	%
	% RESULT = Abbildung 10.4 b
	\newcommand{\figrefaddt}[2]{Abbildung~\ref{#1}~#2}
	%
	% --------------------------------------------------
	% RESULT = (siehe Seite 12)
	\newcommand{\seepage}[1]{(siehe Seite~\pageref{#1})}

	\renewcommand{\tt}[1]{\texttt{\color{red}{#1}}}

	\renewcommand{\bf}[1]{\textbf{#1}}
	


% **************************************************
% Titelseite
% **************************************************
	\newcommand{\frontpage}{
		\pagestyle{empty}	
		% Das Logo wird unten rechts am Seitenrand verackert.
		\begin{tikzpicture}[remember picture,overlay,every node/.style={inner sep=0,outer sep=0}]
			\node (back names) [shape=rectangle, minimum height=50mm, minimum width=0.5\paperwidth, anchor=south east] at (current page.south east) {\includegraphics[width=0.5\paperwidth]{gfx/background}};
		\end{tikzpicture}
			% Erstellt in der Übersicht der PDF-Datei den Eintrag "Titelseite"
			\pdfbookmark[0]{Titleseite}{Titleseite}
			{
				% Auswahl der Schriftart
				\fontfamily{phv}\selectfont
				% Die gesamte Seite wird mittig ausgerichtet
				\centering
				% Das Logo mit Namen wird eingefügt
				\includegraphics[width=6cm]{gfx/logo_hsrm} \\[-1mm]
				\textsf{Fachbereich Ingenieurwissenschaften} \\
				% Die Folgende angaben sind aus den Variabeln in der main.tex zu entnehmen
				\textsf{\studiengang} \\
				\textsf{\studienrichtung} \\ [35mm]

				{\large \dokumentenart} \\[5mm]
				{\LARGE \textbf{\titel}}\par\smallskip
				{\large \textbf{\kurs}}\par\medskip
				{Versuchsdurchführung: \versuchsdurchfuehrung}
			
			
				\vfill
							% Angaben zu den Autoren des Dokuments 
							\begin{tabular}[\textwidth]{rl}
								\textit{Studierende}&{\Large \studentA }\ \matStudentA\\
													&{\Large \studentB }\ \matStudentB\\
													&{\Large \studentC }\ \matStudentC\\
								\smallskip			&{\Large \studentD }\ \matStudentD\\
							\end{tabular} \\[10mm]
							\begin{center}
								Rüsselsheim am Main, \datum
							\end{center}
								
			}	
			\newpage
	}

