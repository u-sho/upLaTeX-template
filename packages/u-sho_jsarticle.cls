%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% u-sho_jsarticle.cls                              %%
%%   目次と余白                                     %%
\NeedsTeXFormat{pLaTeX2e}                           %%
\ProvidesClass{u-sho_jsarticle}[2021/03/02 v1.2%    %%
 jsarticle customized ToC layout & margin by u-sho] %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Japanese patch to some packages.  Required before load class.
\RequirePackage{plautopatch}


% Load Decument Class

%% tocdepth の設定①
\newcounter{usho@tocdepth}
\setcounter{usho@tocdepth}{3}

%% tocdepth の設定②
\DeclareOption{sec}{\setcounter{usho@tocdepth}{1}}
\DeclareOption{subsec}{\setcounter{usho@tocdepth}{2}}
\DeclareOption{subsub}{\setcounter{usho@tocepth}{3}} % default

%% other options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsarticle}}
\ProcessOptions\relax

%% load class
\LoadClass{jsarticle}

%% tocdepth の設定③ (final)
\setcounter{tocdepth}{\value{usho@tocdepth}}


% load package
\RequirePackage[%
% margin=25.04truemm,%
 textwidth=49zw,%
 lines=44,%
 centering%
]{geometry}


%%%%%%%%%%%%%%%%%%%%% Table of Contents 〜O'REILLY風〜 %%%%%%%%%%%%%%%%%%%%%%%%%

%% dots
\renewcommand\jsTocLine{\leaders\hbox{．}\hfill}

\makeatletter % 以下 https://github.com/texjporg/jsclasses を改変
%% sectionの目次
\renewcommand*{\l@section}[2]{%
  \ifnum \c@tocdepth >\z@ %
    \addpenalty{\@secpenalty}%
    \addvspace{2.0em \@plus\jsc@mpt}% 上部に空白を追加 +1.0em
    \begingroup %
      \parindent\z@ %
      \rightskip\@tocrmarg %
      \parfillskip-\rightskip %
      \leavevmode\headfont %
      \setlength\@lnumwidth{\jsc@tocl@width}%
      \advance\@lnumwidth 1zw%2zw% 節番号と節題の空白を狭くした
      \advance\leftskip\@lnumwidth \hskip-\leftskip %
      \large{#1}\jsTocLine% 文字大きくした & 点線つけた
      \nobreak\hbox to\@pnumwidth{\,#2}\par% ページ番号と点線を詰めた
    \endgroup%
  \fi}

%% dots
\renewcommand{\@dottedtocline}[5]{\ifnum #1>\c@tocdepth \else %
  \vskip \z@ \@plus.2\jsc@mpt %
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip %
    \parindent #2\relax\@afterindenttrue %
    \interlinepenalty\@M %
    \leavevmode %
    \@lnumwidth #3\relax %
    \advance\leftskip \@lnumwidth \null\nobreak\hskip -\leftskip %
    {#4}\nobreak %
    \jsTocLine \nobreak\hb@xt@\@pnumwidth{%
      \normalfont #5}\par}\fi}% ページ番号と点線を詰めた & 色を合わせた

%% subsectionの目次
\renewcommand*{\l@subsection}{%
  \addvspace{0.5em \@plus\jsc@mpt}% 上部に空白を追加
  \@tempdima\jsc@tocl@width \advance\@tempdima -2zw%-1zw% sectionと揃えた%
  \@dottedtocline{2}{\@tempdima}{3zw}}

%% subsubsectionの目次
\renewcommand*{\l@subsubsection}{%
  \addvspace{0.5em \@plus\jsc@mpt}% 上部に空白を追加
  \@tempdima\jsc@tocl@width \advance\@tempdima 1zw%-1zw% インデント下げ
  \@dottedtocline{3}{\@tempdima}{4zw}}

\makeatother
