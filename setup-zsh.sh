rm -f "${HOME}/.zprofile"
rm -f "${HOME}/.zshrc"

cat ./zshrc | tee "${HOME}/.zshrc" >/dev/null
cat ./zprofile | tee "${HOME}/.zprofile" >/dev/null

source ~/.zshrc

echo "Zsh configuration files have been set up."
