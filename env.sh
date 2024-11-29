pull() {
  echo "opening pull request"
}

fn1() {
  curr=$(pwd)
  cd ~/pros/team-env
  git pull
  cd $curr
}
