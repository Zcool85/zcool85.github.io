# Blog

Site de réflexion sur mes projets

TODO :
- Finaliser les TODO dans le cours sur les batteries lithium
- Ajouter le projet de tapis DDR


## Install ruby on MacOS

```zsh
brew install chruby ruby-install
ruby-install ruby 3.4.1
```

Configure OS to use Chruby :

```zsh
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.4.1" >> ~/.zshrc # run 'chruby' to see actual version
```

Reload terminal and check ruby version :

```zsh
ruby -v
```

## Install prerequisites

```zsh
bundle install
```

## Check all

```zsh
./tools/test.sh
```

## Serve

```zsh
./tools/run.sh
```

## Text and typo

Cf. [Chirpy theme repo](https://github.com/cotes2020/jekyll-theme-chirpy/blob/master/_posts/2019-08-08-text-and-typography.md).

## Emoji

Cf. [Fabrizio Musacchio blog](https://www.fabriziomusacchio.com/blog/2021-08-16-emojis_for_Jekyll/#smileys--emotion).

## MathJax

Cf. [Quickref](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).

## Remove EXIF info on images

Install exiftool :

```zsh
brew install exiftool
```

```zsh
./tools/clean_exif.sh
```