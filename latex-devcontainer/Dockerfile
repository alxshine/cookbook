FROM alxshine/seclab-tex

# install latexindent and dependencies
RUN apt-get update && apt-get install -y texlive-extra-utils make pandoc pandoc-citeproc
RUN PERL_MM_USE_DEFAULT=1 perl -MCPAN -e 'install Log::Dispatch::File, YAML::Tiny, File::HomeDir'

RUN adduser --gecos '' --disabled-password dev
