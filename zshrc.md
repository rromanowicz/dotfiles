## Install Oh my ZSH.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install plugins.

- autosuggesions plugin
  
  ```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  ```

- zsh-syntax-highlighting plugin
  
  ```bash
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  ```

- zsh-fast-syntax-highlighting plugin
  
  ```bash
  git clone https://github.com/zdharma/fast-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-fast-syntax-highlighting
  ```

- zsh-autocomplete plugin
  
  ```bash
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
  ```

## Enable plugins by adding them to .zshrc.

- Open .zshrc
  
   `nvim ~/.zshrc`

- Find the line which says `plugins=(git)`.

- Replace that line with
  `plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-fast-syntax-highlighting zsh-autocomplete)`
