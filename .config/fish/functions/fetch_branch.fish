function fetch_branch -a branch
  git fetch
  git checkout $branch
  git pull origin $branch
end
