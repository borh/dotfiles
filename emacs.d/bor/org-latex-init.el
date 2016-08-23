(eval-after-load "ox-latex"
  '(progn
     (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
     (setq org-latex-pdf-process
      '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "biber %b"
        "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

     (require 's)
     (let ((default-headers "\\usepackage[no-math]{fontspec}
\\usepackage{microtype}
\\defaultfontfeatures+{Ligatures=TeX, Scale=MatchLowercase}
%%\\setmainfont[
%%  Extension = .otf,
%%  SmallCapsFont ={Equity Caps B},
%%  UprightFont ={Equity Text B},
%%  BoldFont ={Equity Text B Bold},
%%  ItalicFont ={Equity Text B Italic},
%%  BoldItalicFont ={Equity Text B Bold Italic}]
%%  {Equity}

\\setmainfont{Equity Text B}[
  SmallCapsFont =  {Equity Caps B},
  BoldFeatures =   {SmallCapsFont={Equity Caps B Bold}},
  BoldFont =       {* Bold},
  ItalicFont =     {* Italic},
  BoldItalicFont = {* Bold Italic},
  Numbers =        {Monospaced}
]

\\newfontfamily\\ConcourseExtraLight{Concourse T2}[
  SmallCapsFont =  {Concourse C2},
  BoldFeatures =   {SmallCapsFont={Concourse C2 Bold}},
  BoldFont =       {* Bold},
  ItalicFont =     {* Italic},
  BoldItalicFont = {* Bold Italic}
]

\\newfontfamily\\ConcourseMedium{Concourse T4}[
  SmallCapsFont =  {Concourse C4},
  BoldFeatures =   {SmallCapsFont={Concourse C4 Bold}},
  BoldFont =       {* Bold},
  ItalicFont =     {* Italic},
  BoldItalicFont = {* Bold Italic}
]

\\newfontfamily\\ConcourseBold{Concourse T6}[
  SmallCapsFont =  {Concourse C6},
  %%BoldFeatures =   {SmallCapsFont={Concourse C6 Bold}},
  %%BoldFont =       {* Bold},
  ItalicFont =     {* Italic}
  %%BoldItalicFont = {* Bold Italic}
]

\\setsansfont{Concourse T3}[
  SmallCapsFont =  {Concourse C3},
  BoldFeatures =   {SmallCapsFont={Concourse C3 Bold}},
  BoldFont =       {* Bold},
  ItalicFont =     {* Italic},
  BoldItalicFont = {* Bold Italic}
]

\\setmonofont{Fira Code}[Scale=0.8]

%%\\usepackage[default,osf]{sourceserifpro}
%%\\usepackage[osf]{sourcesanspro}
%%\\usepackage[osf,scale=.8]{sourcecodepro}

\\usepackage{fixltx2e}
\\usepackage{float}

\\usepackage{luatexja}
\\usepackage{lualatex-math}
\\usepackage{unicode-math}
\\usepackage[fleqn,tbtags]{mathtools}
\\usepackage{xfrac}
\\usepackage{siunitx}
\\sisetup{group-digits=true,group-minimum-digits={3},
          tight-spacing=true,group-separator={,},detect-all=true,
          table-format=1,
          table-number-alignment=right,table-text-alignment=right,input-symbols=()}

\\usepackage{graphicx}
\\usepackage{hyperref}
\\usepackage{color}

\\usepackage{booktabs}

%% \\makeatletter
%% \\def\\maxwidth{\\ifdim\\Gin@nat@width>\\linewidth\\linewidth
%% \\else\\Gin@nat@width\\fi}
%% \\makeatother
%% \\let\\Oldincludegraphics\\includegraphics
%% \\renewcommand{\\includegraphics}[1]{\\Oldincludegraphics[width=\\textwidth]{#1}}
%% %%\\renewcommand{\\includegraphics}[1]{\\Oldincludegraphics[height=.4\\textheight]{#1}}

\\newenvironment{Figure}
  {\\par\\medskip\\noindent\\minipage{\\linewidth}}
  {\\endminipage\\par\\medskip}

\\usepackage[english, american]{babel}
\\usepackage{csquotes}
\\usepackage[style=apa,sortcites=true,sorting=nyt,backend=biber,autocite=inline,hyperref=true,backref=true]{biblatex}
%%\\usepackage[style=ieee,sortcites=true,sorting=nyt,backend=biber,autocite=inline,hyperref=true,backref=false]{biblatex}
\\DeclareLanguageMapping{american}{american-apa}
\\let\\autocite=\\parencite
\\bibliography{~/Dropbox/Org/Bibliography/bibliography}

\\usepackage{enumitem}
\\setlist{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

%% \\newfontfamily\\headingfont[]{Equity Caps A}
%% \\usepackage[small,compact]{titlesec}
%% %%\\titlespacing*{\\chapter}{0pt}{-50pt}{20pt}
%% %%\\titleformat{\\chapter}[block]{\\Large\\headingfont\\bfseries}{\\thechapter}{1em}{}
%% \\titleformat{\\section}[block]{\\large\\headingfont\\bfseries}{\\thesection}{1em}{}
%% \\titleformat{\\subsection}[block]{\\normalsize\\headingfont\\bfseries}{\\thesubsection}{1em}{}
%% \\titleformat{\\subsubsection}[block]{\\normalsize\\headingfont}{\\thesubsubsection}{1em}{}

%%%% Temp comment out for beamer
%%%% %% Format title page (memoir)
%%%% \\pretitle{\\begin{center}\\Large\\ConcourseBold}
%%%% \\posttitle{\\end{center}}
%% \\preauthor{\\begin{flushleft}\\large\\sffamily
%% \\begin{tabular}[t]{l}}
%% \\postauthor{\\end{tabular}\\end{flushleft}}
%% \\predate{\\begin{flushleft}\\large\\sffamily}
%% \\postdate{\\end{flushleft}}
%%
%% %%\\makechapterstyle{mychapterstyle}{
%% %%  \\setlength{\\beforechapskip}{-\\baselineskip}
%% %%  \\setlength{\\afterchapskip}{-\\baselineskip}}
%% %%\\chapterstyle{mychapterstyle}
%% \\chapterstyle{dowding}

\\linespread{1.1} % 1.3

\\setlength{\\parskip}{0.5em}

%%%% \\copypagestyle{mystyle}{myheadings}
%%%% %%\\makeevenhead{mystyle}{\\textbf\\itshape\\thepage\\hspace{1em}\\leftmark}{}{}
%%%% \\makeoddhead {mystyle}{\\ConcourseExtraLight\\sffamily\\textit{\\textbf{\\thepage}\\hspace{.2em}{/\\hspace {.2em}\\thelastpage}\\hspace {1em}\\small\\rightmark}}
%%%%                        {}%{\\small\\textit\\textcopyright Bor Hodošček}
%%%%                        {\\small\\sffamily\\textit{{Created on:} \\today}}
%%%% \\makeheadrule{mystyle}{\\stockwidth}{1.5pt}{}
%%%% \\makeoddfoot  {mystyle}{}{}{}
%%%% %%\\makeevenfoot {mystyle}{}{}{}
%%%%
%%%% \\makeatletter %% because of \\@chapapp
%%%% \\makepsmarks{mystyle}{
%%%%   \\nouppercaseheads
%%%%   %%\\createmark {chapter}      {both}{shownumber}{\\@chapapp\\ }{. \\ }
%%%%   \\createmark {chapter}      {both}{shownumber}{}{. \\ }
%%%%   \\createmark {section}      {both}{shownumber}{}{. \\ }
%%%%   \\createmark {subsection}   {both}{shownumber}{}{. \\ }
%%%%   \\createmark {subsubsection}{both}{shownumber}{}{. \\ }
%%%%   \\createplainmark {toc} {both} {\\contentsname}
%%%%   \\createplainmark {lof} {both} {\\listfigurename}
%%%%   \\createplainmark {lot} {both} {\\listtablename}
%%%%   \\createplainmark {bib} {both} {\\bibname}
%%%%   \\createplainmark {index} {both} {\\indexname}
%%%%   %%\\createplainmark {glossary} {both} {\\glossaryname}
%%%% }
%%%% %% \\makeatother
%%%% %% \\setsecnumdepth{subsubsection}
%%%%
%%%% \\aliaspagestyle{title}{mystyle}
%%%% \\pagestyle{mystyle}")

           ;;"paperwidth=15cm,paperheight=20cm,textwidth=15cm,textheight=20cm,showframe,portrait"
           ;;"\\usepackage[top=13mm,bottom=5mm,left=5mm,right=10mm,headsep=2mm,paperwidth=20cm,paperheight=15cm,textwidth=20cm,textheight=15cm,showframe,landscape]{geometry}"
           (geometry-t-m '(("article"  . "
\\setstocksize{20cm}{15cm}
\\settrimmedsize{20cm}{15cm}{*}
\\settrims{0mm}{0mm}
\\setheadfoot{14pt}{0mm}
\\setlrmarginsandblock{*}{5mm}{*}
\\setulmarginsandblock{*}{15mm}{*}
\\settypeblocksize{18cm}{13.75cm}{*}
\\checkandfixthelayout
\\fixpdflayout

\\usepackage[right,modulo]{lineno}
\\linenumbers")
                           ("portrait"  . "
\\setstocksize{20cm}{15cm}
\\settrimmedsize{20cm}{15cm}{*}
\\settrims{0mm}{0mm}
\\setheadfoot{14pt}{0mm}
\\setlrmarginsandblock{*}{5mm}{*}
\\setulmarginsandblock{*}{15mm}{*}
\\settypeblocksize{18cm}{13.75cm}{*}
\\checkandfixthelayout
\\fixpdflayout

\\usepackage[right,modulo]{lineno}
\\linenumbers")
                           ("portrait-print"  . "
\\setstocksize{297mm}{210mm}
\\settrimmedsize{297mm}{210mm}{*}
\\settrims{0mm}{0mm}
\\setheadfoot{14pt}{0mm}
\\setlrmarginsandblock{*}{20mm}{*}
\\setulmarginsandblock{*}{20mm}{*}
\\settypeblocksize{25cm}{16cm}{*}
\\checkandfixthelayout
\\fixpdflayout

\\usepackage[right,modulo]{lineno}
\\linenumbers")
                           ("landscape" . "
\\setstocksize{15cm}{20cm}
\\settrimmedsize{15cm}{20cm}{*}
\\settrims{0mm}{0mm}
\\setheadfoot{14pt}{0mm}
\\setlrmarginsandblock{*}{5mm}{*}
\\setulmarginsandblock{*}{15mm}{*}
\\settypeblocksize{13.2cm}{18.5cm}{*}
\\checkandfixthelayout
\\fixpdflayout

\\usepackage[right,modulo]{lineno}
\\linenumbers")
                           ("landscape-margin" . "
\\setstocksize{15cm}{20cm}
\\settrimmedsize{15cm}{20cm}{*}
\\settrims{0mm}{0mm}
\\setheadfoot{14pt}{0mm}
\\setlrmarginsandblock{6mm}{35mm}{*}
\\setulmarginsandblock{11mm}{4mm}{*}
\\settypeblocksize{13.9cm}{15.5cm}{*}
\\setmarginnotes{2mm}{35mm}{1mm}
\\checkandfixthelayout[fixed]
\\fixpdflayout

\\renewcommand{\\sideparfont}{\\footnotesize\\selectfont}

\\usepackage[left,modulo]{lineno}
\\renewcommand{\\makeLineNumber}{\\llap{\\linenumberfont\\rlap{\\LineNumber}\\hspace{5mm}}}
\\linenumbers")
                           ("bibliography" . "\\pagestyle{empty}")))
           (document-t-m '(("portrait"  . "11pt")
                           ("portrait-print" . "11pt")
                           ("landscape" . "12pt") ;; extrafontsizes
                           ("landscape-margin" . "10pt")
                           ("article" . "article,reparticle,11pt,final")
                           ("bibliography" . "9pt"))))
       (dolist (class '("portrait" "portrait-print" "landscape" "landscape-margin" "article" "bibliography"))
         (let ((geometry-header (cdr (assoc class geometry-t-m)))
               (document-options (cdr (assoc class document-t-m))))
           (add-to-list 'org-latex-classes
                        `(,class
                          ,(s-lex-format
                            "\\documentclass[oneside,${document-options}]{memoir}\n
${default-headers}\n
${geometry-header}\n
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]")
                    ("\\chapter{%s}" . "\\chapter*{%s}")
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))))

     (setq org-latex-default-class "portrait")
     ;;(setq org-latex-toc-command "\\tableofcontents*\n\n")
     (setq org-latex-toc-command "")
     ;;(setq org-latex-title-command "")
     (add-to-list 'org-latex-classes
                  `("beamer"
                    ,(s-lex-format "\\documentclass[presentation]{beamer}\n
${default-headers}\n
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]")
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
))
