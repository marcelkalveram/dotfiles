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