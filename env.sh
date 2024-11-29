pull() {
  echo "opening pull request"
}

sync_env() {
  curr=$(pwd)
  cd ~/pros/team-env
  git pull
  cd $curr
}
