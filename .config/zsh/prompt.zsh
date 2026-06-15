# Pretty prompt setup
if command -v starship &>/dev/null; then
  source <(starship init zsh)
else
  echo "Warning: starship is not installed"
fi
