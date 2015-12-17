(eval-after-load "ox-latex"
  '(progn
     (setq org-latex-pdf-process
      '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "biber %b"
        "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

     (require 's)
     (let ((default-headers "\\usepackage[no-math]{fontspec}

\\usepackage[default,osf]{sourceserifpro}
\\usepackage[osf]{sourcesanspro}
\\usepackage[osf,scale=.8]{sourcecodepro}

%%\\usepackage{luatexja}
\\usepackage{lualatex-math}
\\usepackage{unicode-math}
\\usepackage[fleqn,tbtags]{mathtools}
\\usepackage{xfrac}

\\usepackage{graphicx}
\\usepackage{hyperref}
\\usepackage{color}

\\renewcommand*{\\glossaryname}{Dictionary}
\\usepackage[xindy,toc]{glossaries}
\\newcommand{\\w}[2]{%
  \\newglossaryentry{#1}{name=#1,description={#2}}%
  \\glslink{#1}{}%
}
\\makeglossaries

\\makeatletter
\\def\\maxwidth{\\ifdim\\Gin@nat@width>\\linewidth\\linewidth
\\else\\Gin@nat@width\\fi}
\\makeatother
\\let\\Oldincludegraphics\\includegraphics
\\renewcommand{\\includegraphics}[1]{\\Oldincludegraphics[width=\\textwidth]{#1}}
%%\\renewcommand{\\includegraphics}[1]{\\Oldincludegraphics[height=.4\\textheight]{#1}}

\\newenvironment{Figure}
  {\\par\\medskip\\noindent\\minipage{\\linewidth}}
  {\\endminipage\\par\\medskip}

\\usepackage{csquotes}
\\usepackage[style=apa,sortcites=true,sorting=nyt,backend=biber,autocite=inline,hyperref=true,backref=true]{biblatex}
\\DeclareLanguageMapping{american}{american-apa}
\\let\\autocite=\\parencite
\\bibliography{~/Dropbox/papers/bibliography/doctors-bibliography}

\\usepackage{enumitem}
\\setlist{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

\\usepackage[compact]{titlesec}
\\titlespacing*{\\chapter}{0pt}{-50pt}{20pt}
%%\\titleformat{\\chapter}[block]{\\Large\\textbf}{\\thechapter}{1em}{}
\\titleformat{\\section}[block]{\\large\\textbf}{\\thesection}{1em}{}
\\titleformat{\\subsection}[block]{\\normalsize\\textbf}{\\thesubsection}{1em}{}
\\titleformat{\\subsubsection}[block]{\\normalsize}{\\thesubsubsection}{1em}{}

%% Format title page (memoir)
\\pretitle{\\begin{flushleft}\\Large\\sffamily}
\\posttitle{\\end{flushleft}}
\\preauthor{\\begin{flushleft}\\large\\sffamily
\\begin{tabular}[t]{l}}
\\postauthor{\\end{tabular}\\end{flushleft}}
\\predate{\\begin{flushleft}\\large\\sffamily}
\\postdate{\\end{flushleft}}

%%\\makechapterstyle{mychapterstyle}{
%%  \\setlength{\\beforechapskip}{-\\baselineskip}
%%  \\setlength{\\afterchapskip}{-\\baselineskip}}
%%\\chapterstyle{mychapterstyle}
\\chapterstyle{chappell}

\\linespread{1.6}

\\setlength{\\parskip}{0.5em}

\\copypagestyle{mystyle}{myheadings}
%%\\makeevenhead{mystyle}{\\textbf\\itshape\\thepage\\hspace{1em}\\leftmark}{}{}
\\makeoddhead {mystyle}{\\sffamily\\textit{\\textbf{\\thepage}\\hspace{.2em}{\\sourcesansprolight/\\hspace {.2em}\\thelastpage}\\hspace {1em}\\small\\rightmark}}
                       {}%{\\small\\textit\\textcopyright Bor Hodošček}
                       {\\small\\sffamily\\textit{{\\sourcesansprolight Created on:} \\today}}
\\makeheadrule{mystyle}{\\textwidth}{1.5pt}{}
%%\\makeoddfoot  {mystyle}{}{}{}
%%\\makeevenfoot {mystyle}{}{}{}

\\makeatletter %% because of \\@chapapp
\\makepsmarks {mystyle}{
  \\nouppercaseheads
  \\createmark {chapter}      {both}{shownumber}{\\@chapapp\\ }{. \\ }
  \\createmark {section}      {both}{shownumber}{} {. \\ }
  \\createmark {subsection}   {both}{shownumber}{} {. \\ }
  \\createmark {subsubsection}{both}{shownumber}{} {. \\ }
  \\createplainmark {toc} {both} {\\contentsname}
  \\createplainmark {lof} {both} {\\listfigurename}
  \\createplainmark {lot} {both} {\\listtablename}
  \\createplainmark {bib} {both} {\\bibname}
  \\createplainmark {index} {both} {\\indexname}
  \\createplainmark {glossary} {both} {\\glossaryname}
}
\\makeatother
\\setsecnumdepth{subsubsection}

\\pagestyle{mystyle}

\\usepackage[right,modulo]{lineno}
\\linenumbers")

           ;;"paperwidth=15cm,paperheight=20cm,textwidth=15cm,textheight=20cm,showframe,portrait"
           ;;"\\usepackage[top=13mm,bottom=5mm,left=5mm,right=10mm,headsep=2mm,paperwidth=20cm,paperheight=15cm,textwidth=20cm,textheight=15cm,showframe,landscape]{geometry}"
           (geometry-t-m '(("portrait"  . "
\\setstocksize{20cm}{15cm}
\\settrimmedsize{20cm}{15cm}{*}
\\settrims{0mm}{0mm}
\\setheadfoot{14pt}{0mm}
\\setlrmarginsandblock{*}{5mm}{*}
\\setulmarginsandblock{*}{15mm}{*}
\\settypeblocksize{18cm}{13.75cm}{*}
\\checkandfixthelayout
\\fixpdflayout")
                           ("landscape" . "
\\setstocksize{15cm}{20cm}
\\settrimmedsize{15cm}{20cm}{*}
\\settrims{0mm}{0mm}
\\setheadfoot{14pt}{0mm}
\\setlrmarginsandblock{*}{5mm}{*}
\\setulmarginsandblock{*}{15mm}{*}
\\settypeblocksize{13.2cm}{18.5cm}{*}
\\checkandfixthelayout
\\fixpdflayout")))
           (document-t-m '(("portrait"  . "11pt")
                           ("landscape" . "12pt,extrafontsizes"))))
       (dolist (class '("portrait" "landscape"))
         (let ((geometry-header (cdr (assoc class geometry-t-m)))
               (document-options (cdr (assoc class document-t-m))))
           (add-to-list 'org-latex-classes
                        `(,class
                          ,(s-lex-format
                            "\\documentclass[oneside,${document-options}]{memoir}\n
${geometry-header}\n
${default-headers}\n
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]")
                    ("\\chapter{%s}" . "\\chapter*{%s}")
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                    ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))))
     (setq org-latex-default-class "portrait")
     ;;(setq org-latex-toc-command "\\tableofcontents*\n\n")
     (setq org-latex-toc-command "")
     (setq org-latex-title-command "")))
