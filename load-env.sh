###################################################################################################
#### team env #####################################################################################

pull() {
  echo "opening pull request"
}

sync_env() {
  curr=$(pwd)
  cd ~/pros/team-env
  git pull
  cd $curr
}

###################################################################################################
#### versions #####################################################################################

export java_version_target="22.0.2"
export node_version_target="19.3.0"
export npm_version_target="9.2.0"
export go_version_target="1.22.1"

equals() {
  [ $1 = $2 ] && echo '✅' || echo '❌'
}

go_version() {
  echo $(go version) | grep -oE 'go[0-9]+\.[0-9]+\.[0-9]+' | sed 's/^go//'
}

node_version() {
  node_ver=$(node --version)
  echo "${node_ver:1}"
}

java_version() {
  echo $(java --version) | grep -oE '\b[0-9]+\.[0-9]+\.[0-9]+\b' | head -n 1
}

version_check() {
  java_ver=$(java_version)
  node_ver=$(node_version)
  npm_ver=$(npm --version)
  go_ver=$(go_version)
  
  java_version_match=$(equals $java_version_target $java_ver)
  node_version_match=$(equals $node_version_target $node_ver)
  npm_version_match=$(equals  $npm_version_target  $npm_ver)
  go_version_match=$(equals   $go_version_target   $go_ver)

  printf "dependency\ttarget\t\tcurrent\t\tmatch\n"
  printf "=====================================================\n"
  printf "java\t\t$java_version_target\t\t$java_ver\t\t$java_version_match\n"
  printf "node\t\t$node_version_target\t\t$node_ver\t\t$node_version_match\n"
  printf "npm\t\t$npm_version_target\t\t$npm_ver\t\t$npm_version_match\n"
  printf "go\t\t$go_version_target\t\t$go_ver\t\t$go_version_match\n"
}

###################################################################################################
###################################################################################################
