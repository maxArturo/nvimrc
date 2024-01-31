# My Neovim Config

I kicked this off from [lunarvim](https://github.com/LunarVim/Launch.nvim.git), but I found several options inscrutable and the `checkHealth` option just gave all sorts of warnings. So I took a hatchet to it and further simplified things. 

## Prereqs

- Neovim 0.9

We will also need `ripgrep` for [telescope](https://github.com/nvim-telescope/telescope.nvim) to work:

- Ripgrep

  ```sh
  sudo apt install ripgrep # or your install method of choice
  ```

## Install the config

Make sure to remove or backup your current `nvim` directory

```sh
git clone https://github.com/maxArturo/nvimrc.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

Next time, open `nvim` and run:

```
:checkhealth
```

