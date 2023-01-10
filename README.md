>**todo**: Use environment to specify workspace directory

# Workstation Setup

This project automates the process of setting up a new RxRevu machine using a simple [Bash](https://www.gnu.org/software/bash/) script.
It was forked from https://github.com/pivotal/workstation-setup

**Warning: this script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

**Note:** the primary branch for this repo is `main` rather than `master`

## Getting Started

- Run the latest version of macOS
- These scripts might work on previous versions, but are maintained with only the latest macOS in mind
- You may need to install the latest version of [Xcode](https://developer.apple.com/xcode/) before starting
    - In a terminal, run: `xcode-select --install`
    - Accept the licensing agreement

Open up Terminal.app and run the following command:

```sh
mkdir -p ~/workspace &&
  cd ~/workspace &&
  git clone https://github.com/rxrevu/workstation-setup.git &&
  cd workstation-setup
```

### Development Machine

If you're setting up a development machine choose which languages and tools to install:

#### For Direct developers (remove unnecessary languages when running command)
`./setup.sh aws ruby python java java-tools docker snowflake terraform intellij mysql`

Optional but recommended:
 - `fzf`
 - `lefthook`
 - `rectangle`
 - `rxrevu_web_app_yml_symlink`

#### For Insights developers
`./setup.sh aws python docker snowflake intellij`

#### For Solutions Architects/Platform Engineers
`./setup.sh aws docker snowflake terraform lefthook`

#### For Scout developers
`./setup.sh aws java16 docker flycut rectangle yarn node16`

Additional options can be installed later by running:

`./add_setup.sh <list of opt-in items to install>`

To see a list of available options run:

```sh
printf "%s " `ls scripts/opt-in | sed 's/\..*//'`; echo
```

### Postgres

See [https://github.com/rxrevu/docker-postgres](https://github.com/rxrevu/docker-postgres)

### Shiftit

Shiftit is no longer under active development, if you want to install it you can add `shiftit` to either your `./setup.sh` or `./add_setup.sh` command line.

### Rectangle (Shiftit Alternative)

Window manager for Mac

## Having problems?

If you see errors from `brew`, try running `brew doctor` and include the diagnostic output in your issue submission.

If you see an error saying `Need sudo access on macOS` which goes on to claim that your user needs to be an administrator
this command should help you out:
```sh
sudo dseditgroup -o edit -a <user-name> -t user admin
```
Run it and try your `./setup.sh` command again.

### Installing .NET
There is a known conflict between `dotnet` and `dotnet-sdk` Homebrew formulae.
The `dotnet` formula is only the runtime, so you probably want `dotnet-sdk`, which includes the .NET runtime.
If you're seeing errors when attempting to install, run `brew uninstall dotnet`.

## Contributing

If you'd like to add programs to this script, make sure they are approved for use.
The security team maintains a [list of authorized software](https://rxrevu.atlassian.net/wiki/spaces/SEC/pages/72351752/Authorized+Software).
Before adding any software to your machine or this script, fill out a [request form](https://rxrevu.atlassian.net/wiki/spaces/PLAT/pages/93520115/Request+Forms) to have it approved.

### Import RubyMine settings
Within RubyMine select `File`->`Manage IDE Settings` ->`Import Settings...`.

Navigate to `workstation-setup/files/rm_settings.zip` and select `rm_settings.zip`.

Select all the settings and hit `Ok`, RubyMine will then prompt you to restart (it is wise to do so).

### AWS Credential Setup
**Note:** Requires staging/prod and sandbox AWS credentials
Change `aws_access_key_id`s and `aws_secret_access_key`s in 
the `~/.aws/credentials` file to use the credentials provided to
you by the security team.

### AWS MFA
Use the `mfa` command to set an MFA token for the next 12 hours.
See the usage message it prints for more information.

To set your token in a new terminal, run `. ~/.aws/mfa_session`

### Standards
- [Logging Standards](standards/logging_standard.md)
