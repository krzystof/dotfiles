#!/bin/bash

function mine {
  sudo chown -R krzystof:krzystof $1
}



#
# Open current repo in a browser on Github
#
function github {
  branch="$(git rev-parse --abbrev-ref HEAD)"
  url="$(git config --get remote.origin.url)"
  url=${url/git@github.com:/http://github.com/}
  url=${url/.git/}

  if [[ $1 =~ "compare"  ]]; then action="compare"
  else action="tree"; fi

  if [[ $2 != ""  ]]; then base="$2..."
  else base=""; fi

  url="${url}/${action}/${base}${branch}"

  # echo "Opening ${url} $(\google-chrome ${url})"
  echo "Opening ${url} $(\firefox -new-tab ${url})"
}



function diary {
  today=`date +%Y-%m-%d`
  vim ~/Dropbox/Journaleries/dailies/${today}.md
}



function journaleries {
  vim ~/Dropbox/Journaleries
}



function cleanbranches {
  git branch --merged | grep -v \* | xargs git branch -d
}
