\NeedsTeXFormat{pLaTeX2e}\ProvidesClass{u-sho_jsarticle}[2021/03/02 v1.2 jsarticle customized ToC layout & margin by u-sho]
\RequirePackage{plautopatch}
\newcounter{usho@tocdepth}
\setcounter{usho@tocdepth}{3}
\DeclareOption{sec}{\setcounter{usho@tocdepth}{1}}
\DeclareOption{subsec}{\setcounter{usho@tocdepth}{2}}
\DeclareOption{subsub}{\setcounter{usho@tocepth}{3}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsarticle}}
\ProcessOptions\relax
\LoadClass{jsarticle}
\setcounter{tocdepth}{\value{usho@tocdepth}}
\RequirePackage[textwidth=49zw, lines=44, centering]{geometry}
\renewcommand\jsTocLine{\leaders\hbox{．}\hfill}
\makeatletter
\renewcommand*{\l@section}[2]{\ifnum \c@tocdepth >\z@ \addpenalty{\@secpenalty}\addvspace{2.0em \@plus\jsc@mpt}\begingroup \parindent\z@ \rightskip\@tocrmarg \parfillskip-\rightskip \leavevmode\headfont \setlength\@lnumwidth{\jsc@tocl@width}\advance\@lnumwidth 1zw \advance\leftskip\@lnumwidth \hskip-\leftskip \large{#1}\jsTocLine \nobreak\hbox to\@pnumwidth{\,#2}\par \endgroup \fi}
\renewcommand{\@dottedtocline}[5]{\ifnum #1>\c@tocdepth \else \vskip \z@ \@plus.2\jsc@mpt {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip \parindent #2\relax\@afterindenttrue \interlinepenalty\@M \leavevmode \@lnumwidth #3\relax \advance\leftskip \@lnumwidth \null\nobreak\hskip -\leftskip {#4}\nobreak \jsTocLine \nobreak\hb@xt@\@pnumwidth{\normalfont #5}\par}\fi}
\renewcommand*{\l@subsection}{\addvspace{0.5em \@plus\jsc@mpt}\@tempdima\jsc@tocl@width \advance\@tempdima -2zw \@dottedtocline{2}{\@tempdima}{3zw}}
\renewcommand*{\l@subsubsection}{\addvspace{0.5em \@plus\jsc@mpt}\@tempdima\jsc@tocl@width \advance\@tempdima 1zw \@dottedtocline{3}{\@tempdima}{4zw}}
\makeatother
