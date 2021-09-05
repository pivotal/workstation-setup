echo
echo "We need SDKMAN, so the latest java version is installed. "
source ${WORK_DIR}/scripts/opt-in/java.sh
echo "Installing Java 8"
sdk install java $(sdk ls java |grep 8.0|grep hs-adpt|cut -d\| -f6)
