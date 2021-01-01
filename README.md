# Workstation Setup

This project automates the process of setting up a new Pivotal machine using a simple [Bash](https://www.gnu.org/software/bash/) script.

## Goals

The primary goal of this project is to give people a simple script they can run to make their machine a bit more useful and standard for working on Pivotal projects.

 * A bash script is easy for users to edit locally on-the-fly for small temporary tweaks
 * Everything is in one repository
 * The project name is informative
 * Keep it easy to fork and customize
 * It has very limited requirements: git, bash and Ruby are all available on macOS by default

## Anti-goals

This project does not aim to do everything. Some examples:

 * We don't install everything that your project needs. These scripts should only install generally useful things, and prefer running quickly over being complete.
 * We avoid setting up and maintaining overly-custom configurations. When there is already a tool that will get us something in a conventional manner, such as [bash-it](https://github.com/Bash-it/bash-it), we prefer to use it instead of doing things ourselves.

**Warning: the automation script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

## Getting Started

- Run the latest version of macOS, currently [High Sierra](https://www.apple.com/macos/high-sierra/),
  unless you have a specific reason not to
- These scripts might work on previous versions, but are maintained with only the latest macOS in mind
- If you are not on High Sierra, you need to install the latest version of [Xcode](https://developer.apple.com/xcode/)
- On High Sierra, once you have used git (below), you will have installed the command line developer tools

Open up Terminal.app and run the following command:

```sh
mkdir -p ~/workspace &&
  cd ~/workspace &&
  git clone https://github.com/pivotal/workstation-setup.git &&
  cd workstation-setup
```

### Engineering Machine

If you're setting up an engineering machine choose which languages to install:

```sh
# For Labs developers (remove unnecessary languages when running command)
./setup.sh java ruby node golang python c docker

# For Data developers
./setup.sh c golang java docker

# For .net
./setup.sh dotnet
```

The list of Engineering applications is found in: [applications-common.sh](https://github.com/pivotal/workstation-setup/blob/master/scripts/common/applications-common.sh)

### Designer Machine

If you're setting up a design machine run the following:

```sh
./setup.sh designer
```

In addition to the Engineering applications, this script also installs the list of Design applications found in: [applications-designer.sh](https://github.com/pivotal/workstation-setup/blob/master/scripts/opt-in/designer.sh)

### XP Workshop

If you're setting up a machine for the XP workshop run the following:

```sh
./setup.sh java node
```

## Analytics

The tool will send anonymous user data to our Google Analytics account, so we can see what command line arguments are popular.  You can disable this:
```
# Remove unnecessary languages when running command
SKIP_ANALYTICS=1 ./setup.sh java ruby node golang c docker
```
This will also disable brew's [data collection](https://github.com/Homebrew/brew/blob/master/docs/Analytics.md).

## Having problems?

If you're having problems using the setup script, please let us know by [opening an issue](https://github.com/pivotal/workstation-setup/issues/new).

If you see errors from `brew`, try running `brew doctor` and include the diagnostic output in your issue submission.

## Customizing

If you'd like to customize this project for a project's use:

- Fork the project
- Edit the shells scripts to your liking
- Profit

## Frequently Asked Questions

### Is it okay to run `./designer.sh` command again?

Yes. The script does not reinstall apps that are already on the machine.

### What about sprout-wrap?

This project is provided as an alternative to the [pivotal-sprout/sprout-wrap](https://github.com/pivotal-sprout/sprout-wrap) project. You are encouraged to use that project if it better suits your needs.

The goals of this projects is to keep the setup process simple and up to date:

Please see [this GitHub issue](https://github.com/pivotal/workstation-setup/issues/3) for more discussion on the subject.
