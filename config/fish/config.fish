if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    sh -c echo
    sh -c "fastfetch -l small"
    sh -c echo
    sh -c /home/felipe/Documents/github/ISORememberer/rememberer.sh
    sh -c echo
end

fish_add_path /home/felipe/.spicetify

# Created by `pipx` on 2025-05-15 12:48:16
set PATH $PATH /home/felipe/.local/bin
