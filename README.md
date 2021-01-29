# Workstation Setup

This project automates the process of setting up a new RxRevu machine using a simple [Bash](https://www.gnu.org/software/bash/) script.
It was forked from https://github.com/pivotal/workstation-setup

**Warning: this script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

## Getting Started

- Run the latest version of macOS
- These scripts might work on previous versions, but are maintained with only the latest macOS in mind
- You may need to install the latest version of [Xcode](https://developer.apple.com/xcode/) before starting

Open up Terminal.app and run the following command:

```sh
mkdir -p ~/workspace &&
  cd ~/workspace &&
  git clone https://github.com/rxrevu/workstation-setup.git &&
  cd workstation-setup
```

### Development Machine

If you're setting up a development machine choose which languages to install:

```sh
# For Direct developers (remove unnecessary languages when running command)
./setup.sh direct-dev aws ruby python docker oh-my-zsh snowflake terraform

# For Insights developers
./setup.sh aws python docker oh-my-zsh snowflake terraform

# For Solutions Architects/Platform Engineers
./setup.sh aws docker oh-my-zsh snowflake terraform
```

## Having problems?

If you see errors from `brew`, try running `brew doctor` and include the diagnostic output in your issue submission.

>**todo**: is this still correct?
### Import RubyMine settings
Within RubyMine select `File`->`Import Settings...`.

Navigate to `workstation-setup/files/rm_settings.zip` and select `rm_settings.zip`.

Select all the settings and hit `Ok`, RubyMine will then prompt you to restart (it is wise to do so).

### AWS Credential Setup
>**todo**: add safe copying of sample aws credental files to the aws opt-in script
**Note:** Requires staging/prod and sandbox AWS credentials
Change `aws_access_key_id`s and `aws_secret_access_key`s in 
the ~/.aws/credentials directory to use the credentials provided to
you by the security team.

>**todo**: removed account setup as HR is maintaining this workflow

### AWS MFA
Use the `mfa` command to set an MFA token for the next 12 hours.
See the usage message it prints for more information.

To set your token in a new terminal, run `. ~/.aws/mfa_session`

### Standards
- [Logging Standards](standards/logging_standard.md)
