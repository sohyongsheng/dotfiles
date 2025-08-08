Dotfiles
========

Installing
----------

Clone this repo to a bare repo called `dotfiles.git`. This contains all
the files that Git needs for its internal operation. By convention, the
bare repo ends with a `.git` extension.

    git clone --bare git@github.com:sohyongsheng/dotfiles.git ${HOME}/.config/dotfiles.git

Add this alias `dof`. This is like the normal `git` command, but
specifies the Git directory (internal files that Git uses), and the
working tree (actual files that we work on). We can use this alias `dof`
in replacement of `git`, e.g. `dof status`, `dof branch`, `dof push`,
etc.

    alias dof='git --git-dir ${HOME}/.config/dotfiles.git/ --work-tree ${HOME}'

Don't show untracked files when doing `dof status`. Otherwise, Git would
recursively list all files from the home directory, which would either
lag our computer or  flood the entire screen.

    dof config status.showUntrackedFiles no

Configure the bare repo to add remote-tracking branches. By default,
bare repos don't have working trees, and hence Git doesn't expect us to
push/pull on bare repos, so Git didn't create remote-tracking branches.

    dof config --add remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

Checkout the files from the bare repo onto the working tree.

    dof checkout master

Clone and update working trees of submodules. These are normally
plugins.

    dof submodule update --init

The above command `submodule update` leaves each sub-repository in a
detached `HEAD` state. We'll need to checkout the master branch,
otherwise tpm (Tmux Plugin Manager) would complain.

    dof submodule foreach 'git checkout master || git checkout main'

Check if vim has clipboard support by running

    vim --version | grep xterm_clipboard

If you see a `+xterm_clipboard` (`+` in front of `xterm_clipboard`) ,
you are good to go. Otherwise, if you see a `-` in front of
`xterm_clipboard`, you may install vim-gtk, because it has clipboard
support.

    sudo apt install vim-gtk

Generate helptags for vim plugins.

1. Start vim.
2. Run `:helptags ALL`.

Install git-extras for handy commands like `git alias`.

    sudo apt install git-extras 

Include common config options in

- `.gitconfig` from `.gitconfig.common`. Replace `{name@email.com}` and
  `{Your Name}` as appropriate; normally this email address is your
  company email address.

      [user]
          email = {name@email.com}
          name = {Your Name}
      [include]
          path = .gitconfig.common

  Run `git alias`. The aliases in `.gitconfig.common` should be listed.

- `.bashrc` from `.bashrc.common`

      # Other settings that we want to apply commonly to all our .bashrc
      # files.
      if [ -f ~/.bashrc.common ]; then
          . ~/.bashrc.common
      fi

  Restart your terminal to reload the `.bashrc` file. Then type
  <kbd>Ctrl</kbd> + <kbd>s</kbd>. This should initiate a forward search
  instead of freezing the terminal.

If needed, configure user email locally for this repo.

    dof config user.email sohyongsheng@gmail.com

Install xsel, as tmux-yank (one of the following tmux plugins) needs
it.

    sudo apt install xsel

Install tmux.

    sudo apt install tmux

Then install tmux plugins.

1. Start a tmux session.
2. Press <kbd>prefix</kbd> + <kbd>I</kbd> (capital I). Wait for a while
   for the success message to appear.

Install pyenv

- Install requirements:

      sudo apt update
      sudo apt install \
          build-essential \
          libssl-dev \
          zlib1g-dev \
          libbz2-dev \
          libreadline-dev \
          libsqlite3-dev curl \
          libncursesw5-dev \
          xz-utils \
          tk-dev \
          libxml2-dev \
          libxmlsec1-dev \
          libffi-dev \
          liblzma-dev \
      ;

- Install pyenv:

      curl https://pyenv.run | bash

- Set up shell environment:

      echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
      echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
      echo 'eval "$(pyenv init -)"' >> ~/.bashrc

Updating
--------

To update the Git submodules, run

    dof submodule foreach git pull

TODO: Study Git submodules tutorial to see if the above command is the
best way to pull updates from submodules.

