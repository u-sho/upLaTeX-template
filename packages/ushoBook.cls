%% ushoBook.cls
%%   目次と余白
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ushoBook}[2020/12/28 u-sho's customized jsbook]

%% Load dependencies
\LoadClass[uplatex,dvipdfmx,11pt]{jsbook}
\RequirePackage[textwidth=43zw,lines=49,centering]{geometry}

%% tocdepthの設定
\setcounter{tocdepth}{3}
