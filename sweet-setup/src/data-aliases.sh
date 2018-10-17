alias_delimiter="::"
###############################################################################
# GIT ALIASES
git_aliases=(
  "s::status -sb --ignore-submodules"
  "d::diff"
  "aa::add --all"
  "cm::commit -m"
  "cma::commit -a -m"
  "b::branch"
  "co::checkout"
  "cob::checkout -b"
  "pff::pull --ff-only"
  "mff::merge --ff-only"
  "size::count-objects -vH"
  "remove::rm -r --cached ."
  "hist::log --graph --max-count=100 --pretty=format:\\\"%C(green)%h%C(reset) | %C(yellow)%d%C(reset) %s %C(cyan)%an : %C(dim)%cr%C(reset)\\\" --abbrev-commit"
)
###############################################################################
# PERSONAL GIT WORKFLOW
git_workflow=(
  "gpush::git push"
  "gpull::git pull --rebase --prune git submodule update --init --recursive"
  "gundo::git reset HEAD~1 --mixed"
  "ghub::git clone git clone https://github.com/$argv.git"
  "greset::git add -A\n  git commit -qm 'CLEAN POINT'\n  git reset HEAD~1 --hard\n  git clean -f -d"
  "ginit::git init\n  gi osx >> .gitignore\n  echo \\\"READ.ME\\\" >> README.md\n  gcommit \\\"Initial\\\"\n  if test -n \\\$argv\n    gconnect \\\$repo_uri\n    git push -u origin master\n  end"
  "gconnect::git remote add origin \\\$argv\n  git remote -v"
  "gbranch::git checkout -b \\\$argv"
  "gcommit::git add -A\n  if test -n \\\"\\\$argv\\\"\n        git commit -m \\\"\\\$argv\\\"\n    else\n        git commit -m \\\"WIP\\\"\n    end"
  "gmerge::set merge_branch (git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')\n  git checkout master\n  gpull\n  git rebase -i master\n  git merge \\\$merge_branch"
  "gtrack::git checkout --track origin/$argv"
)
# GIT IGNORE.IO
git_workflow+=(
  "gi::curl -L -s https://www.gitignore.io/api/\$argv"
  "gh::git clone git clone https://github.com/$argv.git"},
)
###############################################################################
haskell_stack_workflow=(
  "sb::stack clean\n  stack build"
  "st::stack test"
  "sr::stack ghci"
  "sdepend::stack list-dependencies"
)

###############################################################################
node_npm_workflow=(
  "ni::npm install $argv"
  "ns::npm run start"
  "nt::npm run test"
  "nd::npm run dev"
  "n::npm run $argv"
)
###############################################################################
shell_aliases=(
  "l::builtin ls -CF"
  "ll::builtin ls -lhA"
  "lll::builtin ls -lhFA | less"
  "o::builtin open ."
  "c::code ."
  "cd..::cd .."
  "...::cd ../../"
  "....::cd ../../../"
  ".....::cd ../../../../"
  "evalinsubs::for d in (ls -d */ | cut -f1 -d'/')\n    cd $d\n    echo "==> $d"\n    eval $argv\n    cd ..\n  end"
)

# function gi
#   for arg in $argv
#     curl -L -s https://www.gitignore.io/api/$arg >> .gitignore
#   end
# end

# function gcommit --argument-names 'message'
#   #USE A CONSISTENT INTERIM MESSAGE IF MISSING
#   if not test -n "$message"
#     message="Interim"
#   end
#   #PREPEND BRANCH NAME
#   if [ branch != "master" ]
#     set branch (git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
#     message=$branch": "$message
#   end

#   git add -A
#   git commit -m "$message"
# end

# function gmerge
#   set merge_branch (git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
#   git checkout master
#   gpull
#   git rebase master
#   git merge $merge_branch -m "merge branch "$merge_branch
# end

function npm-gql-yoga --argument-names 'name'
  mkdir $name
  cd $name
  npm init -y
  mkdir src
  mkdir src/resolvers
  touch src/resolvers.js
  touch src/schema.graphql
  echo "const { GraphQLServer } = require('graphql-yoga')

// Wire and Start
const server = new GraphQLServer({
  typeDefs: './src/schema.graphql',
  resolvers: './src/resolvers.js',
})
server.start(() => console.log(`Server is running on http://localhost:4000`))
" > src/index.js

  npm add graphql-yoga
end