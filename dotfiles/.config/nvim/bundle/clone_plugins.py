import subprocess

def git(*args):
    return subprocess.check_call(['git'] + list(args))

links = [
"https://github.com/LaTeX-Box-Team/LaTeX-Box",
"https://github.com/fholgado/minibufexpl.vim",
"https://github.com/scrooloose/nerdtree",
"https://github.com/jalvesaq/Nvim-R",
"https://github.com/vim-airline/vim-airline",
"https://github.com/terryma/vim-multiple-cursors",
"https://github.com/mhinz/vim-startify",
"https://github.com/klen/python-mode",
"https://github.com/airblade/vim-gitgutter",
"https://github.com/Valloric/YouCompleteMe"
]

for l in links:
    git("clone", l)


def hg(*args):
    return subprocess.check_call(['hg'] + list(args))


links_hg = [
"https://bitbucket.org/ns9tks/vim-fuzzyfinder",
"https://bitbucket.org/ns9tks/vim-l9"
]

for h in links_hg:
    hg("clone", h)

