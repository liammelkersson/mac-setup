# My Mac Setup 💻

Apps, tools and settings I use on my Mac (Apple Silicon, macOS 27).

## Daily drivers

| Use | App |
| --- | --- |
| AI agents | [T3 Code](https://t3.codes) |
| Browser | [Zen](https://zen-browser.app) |
| Code editor | [Zed](https://zed.dev) |
| Email | Outlook |

## Quick start

On a fresh Mac, open `Terminal` and run:

```sh
git clone https://github.com/liammelkersson/mac-setup.git ~/dev/mac-setup
cd ~/dev/mac-setup
./setup.sh
```

`setup.sh` is safe to re-run. It installs:

1. Xcode command line tools
2. [Homebrew](https://brew.sh/)
3. Everything in the [`Brewfile`](Brewfile) (CLI tools and apps)
4. [Oh My Zsh](https://ohmyz.sh/) with Powerlevel10k, zsh-autosuggestions and zsh-syntax-highlighting
5. Dotfiles from [`dotfiles/`](dotfiles) (symlinked, existing files are kept as `.backup`)
6. [Bun](https://bun.sh/) and Node LTS via nvm
7. A `~/dev` folder

Then do the [manual steps](#manual-steps).

## What's in the Brewfile

| Group | Apps / tools |
| --- | --- |
| Terminals and editors | Ghostty, iTerm2, Warp, Zed, VS Code |
| Dev tools | git, gh, Fork, GitHub Desktop, gcloud CLI, LM Studio, T3 Code, SF Symbols, Firefox Developer Edition |
| Languages | nvm, uv, pipx, rbenv/Ruby, Composer, fvm (Flutter), OpenJDK 17/21, MariaDB, xcodegen |
| AI | Claude, ChatGPT |
| Browsers | Arc, Zen, Helium, Chrome |
| Design | Figma, Rotato |
| Work | Raycast, Linear, Notion, Obsidian, Slack, Microsoft 365 (Teams, Outlook, Word, Excel, PowerPoint, OneDrive) |
| Menu bar and utilities | AltTab, Ice, Hidden Bar, Stats, SwiftBar, LinearMouse, LookAway, Flux, AppCleaner, KeyboardCleanTool, Mechvibes, Aerial |
| Media | Spotify (+ spicetify), VLC, HandBrake, ffmpeg, yt-dlp |
| Docs | pandoc, poppler, ghostscript, librsvg |
| Gaming | Discord, Steam, SteelSeries GG |

To refresh the Brewfile from the current Mac: `brew bundle dump --force --file=Brewfile`, then re-group by hand.

## Manual steps

### Mac App Store

- Amphetamine (keep the Mac awake)
- Magnet (window management)
- Pixelmator Pro
- PiPifier (picture in picture for Safari)
- Unzip: RAR ZIP 7Z Unarchiver

### Download from the web

- Adobe Creative Cloud (Photoshop)
- [TinkerTool](https://www.bresink.com/osx/TinkerTool.html) (hidden macOS settings)
- [Ora](https://ora.sh) browser

### Terminal

- Ghostty is the main terminal. iTerm2 settings: [iterm-theme.json](iterm-theme.json)
- Font: Hack Nerd Font Mono (`brew install --cask font-hack-nerd-font`)
- Prompt: Powerlevel10k, config in [`dotfiles/.p10k.zsh`](dotfiles/.p10k.zsh). Run `p10k configure` to change it.

`~/.zshrc` is not in this repo (it holds machine and work settings). The parts that matter:

```sh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
export PATH="$PATH:$HOME/.local/bin"
```

### Zed

Settings and the Apple theme are in [`dotfiles/zed`](dotfiles/zed). The agent panel expects a local [Ollama](https://ollama.com) model (`qwen3.5:9b`).

### macOS settings

1. Finder
2. Dock
3. Menu Bar (Ice hides the clutter, Stats shows CPU/RAM)

## Wallpaper

[`richard-horvath-_nWaeTF6qo0-unsplash.jpg`](richard-horvath-_nWaeTF6qo0-unsplash.jpg)

## Inspo

[YouTube - Code Garden](https://www.youtube.com/watch?v=2_ZbslLnshw&list=PLGxdQClfjj1bqVf9cTtn0V3-aSsUYGJQl&index=3)
