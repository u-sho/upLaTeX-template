%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ushoArticle.cls                                        %%
%%   目次と余白                                           %%
\NeedsTeXFormat{LaTeX2e}                                  %%
\ProvidesClass{ushoArticle}[2020/12/10%                   %%
 u-sho's ToC & more settings depends on jsarticle]        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% tocdepth の設定①
\newcounter{tocsecdepth}
\setcounter{tocsecdepth}{3}

%% Load dependencies

%%   class options
\DeclareOption{sec}{\setcounter{tocsecdepth}{1}}
\DeclareOption{subsec}{\setcounter{tocsecdepth}{2}}
\DeclareOption{subsub}{\setcounter{tocsecdepth}{3}} % default
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsarticle}}
\ProcessOptions\relax
%%   load class
\LoadClass{jsarticle}

%%   load package
\RequirePackage[%
% top=19.05truemm,%
% left=25.4truemm,%
% right=25.4truemm,%
% bottom=25.4truemm,%
 textwidth=49zw,%
 lines=44,%
 centering%
]{geometry}

% tocdepthの設定②
\setcounter{tocdepth}{\value{tocsecdepth}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% Table of Contents 〜O'REILLY風〜 %%%%%%%%%%%%%%%%%%%%%%%%%

%% dots
\renewcommand{\jsTocLine}{\leaders\hbox{．}\hfill}

\makeatletter
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
