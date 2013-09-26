# Git Deploy

Simple setup for deploying to remote repositories. These can be used for local testing, staging or deployment.

### Initialise git

If you haven't already got a git repository, start here. You'll need git installed on both your local machine _and your server_. On Debian based systems run

    sudo apt-get update
    sudo apt-get install git

For other systems please see the [GitHub setup guide](https://help.github.com/articles/set-up-git) to get you started.

    git init
    git add *
    touch .gitignore
    git add .gitignore
    git commit -m "Created repo"

### Install to remote

Once you have a git repository follow the instructions below.

* Run `sh install.sh $1 $2` where `$1` is the directory you wish to copy to. This directory must not exist, do not use a trailing slash. Use `$2` for the name of your remote for `git push`
* Now running `git push remote-name` in your development directory will deploy to your remote repo.

__For SSH connections__

The install script uses three scp commands and an ssh command. If you do not have an SSH key setup for your networked server you'll need to enter your password four times during setup. Once set up you will still need to enter a password when pushing to the server, so it is recommended you copy an SSH key first. See [the Ubuntu help pages](https://help.ubuntu.com/community/SSH/OpenSSH/Keys#Transfer_Client_Key_to_Host) for a good guide on how to do this.

__Remove a remote__

Just run `git remote rm remote-name` to remove a remote. You can handle deletion of the files separately.

#### Old instructions before install.sh

* Copy whole directory including `.git` to `/var/www` or `user@server:/var/www`.
* Run `git remote add "remote-name" "remote-dir"/.git`
* Switch to the remote directory
* Copy `git-remote-config` to `.git/config`
* Copy `git-hooks-post-update` to `.git/hooks/post-update`
* Run `chmod +x .git/hooks/post-update` 
* Now running `git push remote-name` in your development directory will deploy to your remote repo.

