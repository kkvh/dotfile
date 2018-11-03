# Colors
GREEN='\033[0;32m'
GREEN_L='\033[1;32m'
NC='\033[0m'

function run() {
	echo -e "${GREEN}${1}${NC}"
}

function info() {
	echo -e "${GREEN_L}${1}${NC}"
}
