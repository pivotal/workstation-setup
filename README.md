# Workstation Setup

This project automates the process of setting up a new Mac OS X software development machine using simple [Bash](https://www.gnu.org/software/bash/) scripting. It heavily relies on [homebrew](https://brew.sh/).

## Goals

The primary goal of this project is to give people a simple script they can run to make their Mac OS X machine prepared and standardized for working on software development projects, especially those common at VMware Tanzu Labs.

## Why did we do it this way?

 * A bash script is easy for users to edit locally on-the-fly for small temporary tweaks
 * Everything is in one repository
 * The project name is informative
 * It is easy to fork and customize
 * It has limited requirements: `git` and `bash` available on macOS by default

## Anti-goals

This project does not aim to do everything. Some examples:

 * We don't install everything that your project needs. These scripts should only install generally useful things, and prefer running quickly over being complete.
 * We avoid setting up and maintaining overly-custom configurations. When there is already a tool that will get us something in a conventional manner, such as [Oh My Zsh](https://ohmyz.sh/), we prefer to use it instead of doing things ourselves.

## Preparation

- Run the latest version of macOS unless you have a specific reason not to
- These scripts might work on previous versions, but are maintained with only the latest macOS in mind
- Install the latest version of [Xcode](https://developer.apple.com/xcode/)

## Getting this tool
Open up `Terminal.app` and run the following command:

```sh
mkdir -p ~/workspace &&
  cd ~/workspace &&
  git clone https://github.com/pivotal/workstation-setup.git &&
  cd workstation-setup
```

**Note:** This might prompt you to install the latest Xcode command line development tools. Please do so if prompted. 

## Using this tool
Within `~/workspace/workstation-setup`, run the following:

```sh
./setup.sh [--list] [list of optional configurations]
```

Examples:
```sh
# This will only install the default items
./setup.sh 

# This will install the latest Java and Docker
./setup.sh java docker

# This will only print a list of optional configurations available
./setup.sh --list
```

**Warning: this tool might overwrite existing configurations.**

### Items installed by default
We recommend that you look at `setup.sh` to see what is automatically installed. You'll see it calls other scripts within `scripts/common`, so feel free to take a look at those, too. Note that you can edit any of those files to add or remove items specific for your needs, but the goal of this project is to have sane defaults for our target audience.

### Opt-In Configurations
Please look in `scripts/opt-in/` for optional, opt-in configurations. Some of these are languages and associated frameworks, such as `java` and `golang`. Some are supporting infrastructure, such as `docker` and `kubernetes`. Others might be specific tools for application platforms, such as `cloud-foundry`.

To install any of these, add them as arguments to `setup.sh`. Examples: 

```sh
# Common for Spring Boot development
./setup.sh java spring-boot docker

# Lots of languages
./setup.sh java ruby node golang python c

# Love those platforms!
./setup.sh golang docker kubernetes cloud-foundry terraform concourse
```

To see a list of available optional, opt-in configurations, run the following:

```sh
./setup.sh --list
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

## Frequently Asked Questions and Troubleshooting
_Q: Can I rerun `setup.sh`?_

A: Yes, but with a _but_. While this script is not entirely [idempotent](https://en.wikipedia.org/wiki/Idempotence), it does use homebrew's cache to skip reinstalling items, and is pretty lenient about ignoring errors when non-homebrew items get mad that they are already installed. There is no guarantee that some configurations won't be overwritten or duplicated. 

_Q: Should I run this with `sudo`?_

A: No. `setup.sh` will ask you for your password take care of that for you.

_Q: I'm getting permission errors such as the one below:_
```sh 
Error: Can't create update lock in /usr/local/var/homebrew/locks!
Fix permissions by running:
  sudo chown -R $(whoami) /usr/local/var/homebrew
```
A: **Short answer:** run the suggested command or consider the **Possible Solution** described below.

**Longer answer:** You might have multiple user profiles on your machine that are using homebrew (such as this tool) resulting in a mix of file and directory ownership under `/usr/local/var/homebrew`. This should mostly be an issue with installing things, but not using the tools installed by `brew`. If you switch between profiles _and_ install tools using `brew` often you might run into this a lot.

**Possible Solution:** Try this solution from [itectec](https://itectec.com/superuser/enable-multiple-users-to-install-software-using-homebrew/) which makes homebrew's directories writable by the `staff` group, which should be all admin users on your machine.

1. Note your default `umask` for later.

   ```shell
    $> umask
    022
    ```

2. Set homebrew's directories to be writable by everyone in the `staff` group.

    ```shell
    umask 002 # group write permission
    sudo chmod -R g+w /usr/local/* # group writable
    sudo chgrp -R staff /usr/local/* # staff owned
    ```

3. Set your `umask` back to the default.

   ```shell
    umask 022 # or whatever you noted earlier
   ```

_Q: How to I get my change into this tool?_

A: Submit a PR, especially for things that are outdated or broken. But, we are being vigilant about keeping this tool lean after a history of letting many idiosyncratic changes creep in over the past few years. As stated above, you can edit the files yourself after downloading them and/or fork.
