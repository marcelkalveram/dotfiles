function findprocess {
  sudo lsof -i | grep $1
}

# find process running on a port
function findport {
  sudo lsof -i :$1
}

function killprocess {
  kill -9 $1
}

# Functions
function take {
	mkdir $1
	cd $1
}

function cdl { cd $1; ls;}

# iOS - find architectures in framework file (e.g. 'architectures XYZ.framework/XYZ')
function architectures() {
  if $(lipo -info $1 | grep -q 'not a fat file'); then
    lipo -info $1 | awk -F ': ' '/Non-fat file/ { print $3 }'
  else
    lipo -detailed_info $1 | awk '/^architecture / { print $2 }'
  fi
}

if [[ $(basename $0) == 'architectures' ]]; then
  architectures $1
fi

### Functions for setting and getting environment variables from the OSX keychain ###
### Adapted from https://www.netmeister.org/blog/keychain-passwords.html ###

# Use: keychain-environment-variable SECRET_ENV_VAR
function keychain-environment-variable () {
    security find-generic-password -w -a ${USER} -D "environment variable" -s "${1}"
}

# Use: set-keychain-environment-variable SECRET_ENV_VAR
#   provide: super_secret_key_abc123
function set-keychain-environment-variable () {
    [ -n "$1" ] || print "Missing environment variable name"
    
    # Note: if using bash, use `-p` to indicate a prompt string, rather than the leading `?`
    read -s "?Enter Value for ${1}: " secret
    
    ( [ -n "$1" ] && [ -n "$secret" ] ) || return 1
    security add-generic-password -U -a ${USER} -D "environment variable" -s "${1}" -w "${secret}"
}