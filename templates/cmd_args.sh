prefix="/usr/local"
bin="%prefix%/bin"
base="%prefix%/lib/bazel"
should_uncompress=true


# here the arguments to the script are iterated over
# the 
for opt in "${@}"; do
  case $opt in
    --prefix=*)
      prefix="$(echo "$opt" | cut -d '=' -f 2-)"
      ;;
    --bin=*)
      bin="$(echo "$opt" | cut -d '=' -f 2-)"
      ;;
    --base=*)
      base="$(echo "$opt" | cut -d '=' -f 2-)"
      ;;
    --user)
      bin="$HOME/bin"
      base="$HOME/.bazel"
      ;;
    --skip-uncompress)
      should_uncompress=false
      ;;
    *)
      usage
      ;;
  esac
done


exit 0

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - attempt to capture frames"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-a, --action=ACTION       specify an action to use"
      echo "-o, --output-dir=DIR      specify a directory to store output in"
      exit 0
      ;;
    -a)
      shift
      if test $# -gt 0; then
        export PROCESS=$1
      else
        echo "no process specified"
        exit 1
      fi
      shift
      ;;
    --action*)
      export PROCESS=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    -o)
      shift
      if test $# -gt 0; then
        export OUTPUT=$1
      else
        echo "no output dir specified"
        exit 1
      fi
      shift
      ;;
    --output-dir*)
      export OUTPUT=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    *)
      break
      ;;
  esac
done
