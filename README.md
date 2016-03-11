# Workstation Setup

This project automates the process of setting up a new Pivotal Labs machine using a simple [Bash](https://www.gnu.org/software/bash/) script.

## Getting Started

**Warning: the automation script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

- Update to [El Capitan](https://itunes.apple.com/us/app/os-x-el-capitan/id1018109117)
- Install [Xcode 7](https://itunes.apple.com/us/app/xcode/id497799835)

Then open up the OS X Terminal and run the following commands:

```sh
$ cd workspace
$ git clone https://github.com/pivotal/workstation-setup.git
$ cd workstation-setup
```

### Engineering Machine

If you're setting up an engineering machine run the following:

```sh
$ ./engineer.sh
```

### Designer Machine

If you're setting up an engineering machine run the following:

```sh
$ ./designer.sh
```

## Having problems?

If you're having problems using the setup script, please let us know by [opening an issue](https://github.com/pivotal/workstation-setup/issues/new).

## Customizing

If you'd like to customize this project for a project's use:

- Fork the project
- Edit `./scripts/setup.sh` to your liking
- Profit

## What about sprout-wrap?

This project is provided as an alternative to the [pivotal-sprout/sprout-wrap](https://github.com/pivotal-sprout/sprout-wrap) project. You are encouraged to use that project if it better suits your needs.

The goals of this projects is to keep the setup process simple and up to date:

- A bash script is easy to manage
- Everything is in one repository
- The project name is informative
- Keep it easy to fork and customize
- It has very limited requirements: git, bash and Ruby are all available on OS X by default

Please see [this GitHub issue](https://github.com/pivotal/workstation-setup/issues/3) for more discussion on the subject.
