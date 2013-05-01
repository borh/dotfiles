(setq TeX-open-quote "“")
(setq TeX-close-quote "”")
(add-hook 'org-mode-hook 'smart-quote-keys)

(defun smart-quote-keys ()
  (require 'typopunct)
  (typopunct-change-language 'english)
  (local-set-key (kbd "C-c \'") 'typopunct-insert-single-quotation-mark)
  (local-set-key (kbd "C-c \"") 'typopunct-insert-quotation-mark)
  )

(require 'ob)
(require 'ob-tangle)

(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))
(require 'ess-site)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (R . t)
   (clojure . t)))

;; http://www.blogger.com/blogger.g?blogID=3908276794795362019#sec-1
(defun org-babel-execute:clojure (body params)
  "Evaluate a block of Clojure code with Babel."
  (concat "=> "
          (if (fboundp 'slime-eval)
              (slime-eval `(swank:interactive-eval-region ,body))
           (if (fboundp 'lisp-eval-string)
             (lisp-eval-string body)
              (error "You have to start a clojure repl first!")))))

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-babel-evaluate nil)
(setq org-src-window-setup 'current-window)
(setq inferior-lisp-program "lein repl")

(require 'org-latex)
;(require 'org-export) ;; experimental
;(require 'org-e-latex) ;; cant find in main tree??

(setq org-export-latex-listings 'minted
      org-export-latex-minted-options
      '(("frame" "lines")
        ("fontsize" "\\scriptsize")
        ("linenos" "")))
;;(add-to-list 'org-export-latex-packages-alist '("" "minted"))
;;(setq org-export-latex-custom-lang-environments
;;      '(
;;         (R "r")
;;       ))

(add-to-list 'org-export-latex-classes
  '("xelatex-org-article"
"\\documentclass[11pt,paper=a4,twocolumn=false]{scrartcl}
%\\documentclass[xetex]{tufte-book}
\\usepackage{fontspec,xltxtra,xunicode,xeCJK}
\\usepackage{graphicx}
\\usepackage{comment}% for org-mode tables
\\defaultfontfeatures{Mapping=tex-text,Fractions=Off,Scale=MatchLowercase,Ligatures=TeX}
%\\XeTeXinterchartokenstate = 1
%\\XeTeXlinebreaklocale \"ja_JP\"
%\\XeTeXlinebreakskip=0em plus 0.1em minus 0.01em
%\\XeTeXlinebreakpenalty=0
\\usepackage{unicode-math}
\\setCJKmainfont[Scale=0.9]{Hiragino Mincho Pro W3}
%\\setCJKmainfont[Scale=0.9]{Hiragino Kaku Gothic Pro W3}
\\setCJKsansfont[Scale=0.9]{Hiragino Kaku Gothic Pro W3}
\\setCJKmonofont[Scale=0.9]{Hiragino Kaku Gothic Pro W3}
\\setmainfont{Linux Libertine}
%\\setmainfont{TeX Gyre Pagella}
\\newfontfamily\\fallbackfont{DejaVu Sans}
\\usepackage{newunicodechar}
\\newunicodechar{☑}{{\\fallbackfont ☑}}
\\newunicodechar{☐}{{\\fallbackfont ☐}}
\\setsansfont{TeX Gyre Heros}
%\\setmonofont{TeX Gyre Cursor}
\\setmonofont{Ricty}
\\setmathfont{Cambria Math}

\\usepackage{minted}

\\usepackage[top=2cm,bottom=2.2cm,left=2cm,right=2cm]{geometry}
\\pagestyle{empty}
\\usepackage[small,compact,sc]{titlesec}
\\usepackage{titling}
\\pretitle{\\noindent\\Large\\bfseries}
\\posttitle{\\\\}
\\preauthor{\\itshape}
\\postauthor{, }
\\predate{\\itshape}
\\postdate{}
\\setlength{\\droptitle}{-1in}
\\usepackage{paralist}
\\let\\itemize\\compactitem
\\let\\description\\compactdesc
\\let\\enumerate\\compactenum
\\usepackage[setpagesize=false,xetex]{hyperref}
\\usepackage[delarray]{tabu}
\\usepackage{multirow}
\\setlength{\\extrarowsep}{4pt}
\\usepackage{siunitx}
\\newcolumntype Z{X[r]}
\\usepackage{longtable}

\\usepackage{xcolor}
\\definecolor{spot}{rgb}{0,0.2,0.6}
% error vvv ???
%\\renewcommand*{\\sectionfont}{\\color{spot}\\sffamily\\bfseries}
\\setlength{\\aftersectionskip}{0.75\\baselineskip}

% If you want double spacing
%\\renewcommand{\\baselinestretch}{2.0}

% section numbering in margins
\\renewcommand*{\\othersectionlevelsformat}[1]{%
        \\makebox[0pt][r]{%
        \\csname the#1\\endcsname\\enskip}%
        }

\\usepackage{endnotes}
\\let\\footnote=\\endnote

%\\usepackage{booktabs}
\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-export-latex-classes
  '("lualatex-org-article"
"\\documentclass[11pt,paper=a4,twocolumn=false,hyphens,draft]{scrartcl}

\\usepackage{luatexja}
\\usepackage{luatexja-fontspec}
\\setmainjfont{HiraMinPro}

\\usepackage{graphicx}
\\usepackage{xunicode}
\\newfontfeature{Microtype}{protrusion=quality;expansion=quality;}
\\defaultfontfeatures{Microtype,Fractions=Off,Scale=MatchLowercase,Ligatures=TeX}
\\usepackage{unicode-math}
%\\setmathfont{XITS}
\\setmathfont[
  BoldFont={SourceSansPro-Bold},
  ItalicFont={SourceSansPro-It},
  BoldItalicFont={SourceSansPro-BoldIt}
]{SourceSansPro-Regular}

\\everymath{\\luatexcatcodetable\\CatcodeTableLaTeX}
\\everydisplay{\\luatexcatcodetable\\CatcodeTableLaTeX}
%\\setmainfont[
%  BoldFont={LinLibertineB},
%  ItalicFont={LinLibertineI},
%  BoldItalicFont={LinLibertineBI}
%]{LinLibertine}
\\setmainfont[
  BoldFont={SourceSansPro-Bold},
  ItalicFont={SourceSansPro-It},
  BoldItalicFont={SourceSansPro-BoldIt}
]{SourceSansPro-Regular}
%\\setsansfont{LinBiolinum}
\\setsansfont[
  BoldFont={SourceSansPro-Bold},
  ItalicFont={SourceSansPro-It},
  BoldItalicFont={SourceSansPro-BoldIt}
]{SourceSansPro-Regular}
\\setmonofont{DroidSansMono}
\\usepackage{microtype}

\\typearea[current]{last} % recalculate type area based on these new fonts

\\usepackage{comment}% for org-mode tables
\\usepackage{minted}
\\usemintedstyle{colorful}
\\newminted[R]{r}{showspaces,linenos=true}

\\newenvironment{terminal}{%
  \\VerbatimEnvironment
  \\minted@resetoptions
  \\setkeys{minted@opt}{frame=single}
  \\begin{figure}[htp]
    \\centering
    \\begin{minipage}{9cm}
      \\begin{VerbatimOut}{\\jobname.pyg}}
{%
      \\end{VerbatimOut}
      \\minted@pygmentize{r}
      \\DeleteFile{\\jobname.pyg}
    \\end{minipage}
  \\end{figure}}

\\usepackage{hyphenat}
\\usepackage[american]{babel}
\\usepackage{csquotes}
\\usepackage[style=apa,backend=biber,apabackref=true]{biblatex}
\\DeclareLanguageMapping{american}{american-apa}
\\addbibresource{doctors-bibliography.bib}

\\usepackage[setpagesize=false,unicode=true]{hyperref}
\\usepackage{breakurl} % doesn't seem to work
%\\usepackage{newverbs}[2011/07/24] % break urls
%\\let\\orighref\\href
%\\renewcommand{\\href}{\\Collectverb{\\hrefii}}
%\\newcommand\\hrefii[2]{\\orighref{#1}{#2}}


\\usepackage{xcolor}
\\definecolor{spot}{rgb}{0,0.2,0.6}

\\usepackage[top=2cm,bottom=2.2cm,left=2cm,right=2cm]{geometry}
\\pagestyle{empty}
\\usepackage[small,compact,sc]{titlesec}
\\usepackage{titling}
\\pretitle{\\color{spot}\\noindent\\Large\\bfseries}
\\posttitle{\\\\}
%\\titleformat{\\section}{\\color{spot}}{\\thesection}{1em}{}
\\preauthor{\\itshape}
\\postauthor{, }
\\predate{\\itshape}
\\postdate{}
\\setlength{\\droptitle}{-1in}
\\usepackage{paralist}
\\let\\itemize\\compactitem
\\let\\description\\compactdesc
\\let\\enumerate\\compactenum
\\usepackage{booktabs}
\\usepackage[delarray]{tabu}
\\usepackage{multirow}
\\setlength{\\extrarowsep}{4pt}
\\usepackage{siunitx}
\\usepackage{longtable}

\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
     ("\\part{%s}" . "\\part*{%s}")
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-export-latex-classes
  '("xelatex-org-beamer"
"\\documentclass[xcolor=x11names,14pt,xetex,hyperref={pdfpagelables=false}]{beamer}
\\usepackage{fontspec,xltxtra,xunicode,xeCJK}
\\usepackage{graphicx,booktabs,caption}
% suppress navigation bar
\\beamertemplatenavigationsymbolsempty
\\mode<presentation>
{
  \\usetheme{bunsen}
  \\setbeamercovered{transparent}
  \\setbeamertemplate{items}[circle]
  %\\usetheme{Marburg}
  %\\useoutertheme[glossy]{wuerzburg}
  %\\useinnertheme[outline]{chamfered}
  %\\usecolortheme{shark}
}
%\\usepackage{comment}% for org-mode tables
%\\usepackage{japanese}
\\defaultfontfeatures{Mapping=tex-text,Fractions=Off,Scale=MatchLowercase,Ligatures=TeX}
%\\XeTeXinterchartokenstate = 1
%\\XeTeXlinebreaklocale \"ja_JP\"
%\\XeTeXlinebreakskip=0em plus 0.1em minus 0.01em
%\\XeTeXlinebreakpenalty=0
%\\usepackage{unicode-math}
%\\setCJKmainfont[Scale=0.9]{Hiragino Mincho Pro W3}
\\setCJKmainfont[Scale=0.8]{Hiragino Kaku Gothic Pro W3}
\\setCJKsansfont[Scale=0.8]{Hiragino Kaku Gothic Pro W3}
\\setCJKmonofont[Scale=0.8]{Hiragino Kaku Gothic Pro W3}
\\setmainfont{Linux Libertine}
%\\setmainfont{TeX Gyre Pagella}
%\\newfontfamily\\fallbackfont{DejaVu Sans}
%\\usepackage{newunicodechar}
%\\newunicodechar{☑}{{\\fallbackfont ☑}}
%\\newunicodechar{☐}{{\\fallbackfont ☐}}
%\\setsansfont{Ubuntu}
\\setsansfont{TeX Gyre Heros}
\\setmonofont{TeX Gyre Cursor}
%\\setmathfont{XITS}
\\tolerance=1000
%\\usepackage{breqn}

%\\setbeamerfont{frametitle}{size=\\LARGE,series=\\bfseries}
\\setbeamerfont{frametitle}{size=\\Large,series=\\bfseries}
% color definitions
\\usepackage{color}
\\definecolor{uipoppy}{RGB}{225, 64, 5}
\\definecolor{uipaleblue}{RGB}{96,123,139}
\\definecolor{uiblack}{RGB}{0, 0, 0}

% caption styling
\\DeclareCaptionFont{uiblack}{\\color{uiblack}}
\\DeclareCaptionFont{uipoppy}{\\color{uipoppy}}
\\captionsetup{labelfont={uipoppy},textfont=uiblack}

% see the macros.tex file for definitions
\\include{macros}

\\usepackage{enumerate}

%\\usepackage{paralist}
%\\let\\itemize\\compactitem
%\\let\\description\\compactdesc
%\\let\\enumerate\\compactenum

      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"

  ("\\section{%s}" . "\\section*{%s}")

  ("\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}"
       "\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}")))

(add-to-list 'org-export-latex-classes
  '("lualatex-org-beamer"
"\\documentclass[xcolor=x11names,14pt,lualatex,hyperref={pdfpagelables=false}]{beamer}

\\usepackage{luatexja}
\\usepackage{luatexja-fontspec}
\\usepackage{graphicx}
\\usepackage{xunicode}
\\newfontfeature{Microtype}{protrusion=quality;expansion=quality;}
\\defaultfontfeatures{Microtype,Fractions=Off,Scale=MatchLowercase,Ligatures=TeX}
\\usefonttheme{professionalfonts}
\\usepackage{unicode-math}
\\setmathfont{XITSMath}

%%\\everymath{\\luatexcatcodetable\\CatcodeTableLaTeX}
%%\\everydisplay{\\luatexcatcodetable\\CatcodeTableLaTeX}
%%
\\usepackage{libertineotf}
\\usepackage{tgheros}
%%\\setmainfont{LinuxLibertine}
%%\\setsansfont{TeXGyreHeros-Regular}
\\setmainfont[
  BoldFont={LinLibertineOB},
  ItalicFont={LinLibertineOI},
  BoldItalicFont={LinLibertineOBI}
]{LinLibertineO}
%%\\setsansfont[
%%  BoldFont={TeXGyreHeros-Bold},
%%  ItalicFont={TeXGyreHeros-Italic},
%%  BoldItalicFont={TeXGyreHeros-BoldItalic}
%%]{TexGyreHeros-Regular}
\\setsansfont{SourceSansPro}
\\setmonofont{DroidSansMono}
\\usepackage{microtype}

\\usepackage{hyphenat}
\\usepackage[american]{babel}
\\usepackage{csquotes}
\\usepackage[style=apa,backend=biber,apabackref=true]{biblatex}
\\DeclareLanguageMapping{american}{american-apa}
\\addbibresource{doctors-bibliography.bib}
\\appto\\bibfont{\\tiny}

\\usepackage{graphicx,booktabs,caption}
% suppress navigation bar
\\beamertemplatenavigationsymbolsempty
\\mode<presentation>
{
  \\usetheme{bunsen}
  \\setbeamercovered{highly dynamic}
  \\setbeamertemplate{items}[circle]
  \\setbeamertemplate{caption}[numbered] % number figures and tables
  %\\setbeameroption{show only notes}
  %\\usetheme{Marburg}
  %\\useoutertheme[glossy]{wuerzburg}
  %\\useinnertheme[outline]{chamfered}
  %\\usecolortheme{shark}
}

\\tolerance=1000

%\\setbeamerfont{frametitle}{size=\\LARGE,series=\\bfseries}
\\setbeamerfont{frametitle}{size=\\Large,series=\\bfseries}
% color definitions
\\usepackage{color}
\\definecolor{uipoppy}{RGB}{225, 64, 5}
\\definecolor{uipaleblue}{RGB}{96,123,139}
\\definecolor{uiblack}{RGB}{0, 0, 0}

% caption styling
\\DeclareCaptionFont{uiblack}{\\color{uiblack}}
\\DeclareCaptionFont{uipoppy}{\\color{uipoppy}}
\\captionsetup{labelfont={uipoppy},textfont=uiblack}

% see the macros.tex file for definitions
\\include{macros}

\\usepackage{enumerate}

\\usepackage{tikz}

\\usepackage{multimedia}

      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"

  ("\\section{%s}" . "\\section*{%s}")

  ("\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}"
       "\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}")))

(setq org-latex-to-pdf-process
  '("lualatex -shell-escape -interaction nonstopmode %f"
     ;;"biber -U -u %f" ; find a way to rename %f
     "lualatex -shell-escape -interaction nonstopmode %f"))
;;     "xelatex -shell-escape -interaction nonstopmode %f"))
