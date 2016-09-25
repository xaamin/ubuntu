echo "" >> $HOME/.bashrc
echo "# To remove GREP_OPTIONS is deprecated warnings" >> $HOME/.bashrc

echo "unset GREP_OPTIONS" >> $HOME/.bashrc

echo "" >> $HOME/.bashrc

cat $HOME/.scripts/sources.sh >> $HOME/.bashrc