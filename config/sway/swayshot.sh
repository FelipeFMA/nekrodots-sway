#!/bin/sh
# Screenshot helper for Sway.
# Original script by Witalij Berdinskich.
# Forked by: FelipeFMA for https://github.com/FelipeFMA/nekrodots-sway
# I modified it to copy screenshots by default and improved the notifications for better appearance.

if [ -z $WAYLAND_DISPLAY ]; then
    (>&2 echo Wayland is not running)
    exit 1
fi

## Definindo a pasta para armazenar as capturas
SCREENSHOT_DIR=$(xdg-user-dir PICTURES)/Screenshots

# Criar a pasta Screenshots se não existir
mkdir -p "$SCREENSHOT_DIR"

# Definir o nome do arquivo de captura com timestamp
SCREENSHOT_TIMESTAMP=$(date "+${SWAYSHOT_DATEFMT:-%F_%H-%M-%S_%N}")
SCREENSHOT_FULLNAME="$SCREENSHOT_DIR"/screenshot_${SCREENSHOT_TIMESTAMP}.png

readonly filter='recurse(.nodes[], .floating_nodes[]) | select(.focused and .pid).rect | "\(.x),\(.y) \(.width)x\(.height)"'

make_screenshot() {
    case "$1" in
        -h|--help)
            echo 'Usage: swayshot [display|window|region]'
            return 0
            ;;
        region)
            grim -g "$(slurp -b '#AFAFAFAF' -c '#FF3F3FAF' -s '#00000000' -w 3 -d)" "$2"
            ;;
        window)
            grim -g "$(swaymsg --type get_tree --raw | jq --raw-output "${filter}")" "$2"
            ;;
        *)
            grim -o "$(swaymsg --type get_outputs --raw | jq --raw-output '.[] | select(.focused) | .name')" "$2"
            ;;
    esac
}

copy_to_clipboard() {
    if type wl-copy >/dev/null  2>&1; then
        wl-copy < "$1"
    elif type xsel >/dev/null  2>&1; then
        xsel --clipboard < "$1"
    elif type xclip &>/dev/null; then
        xclip -selection clipboard < "$1"
    else
        echo "$1"
    fi
}

show_message() {
    if type notify-send >/dev/null  2>&1; then
        # Título bonito para a notificação e mensagem clara
        notify-send --expire-time=3000 --category=screenshot --icon="$1" "Screenshot Copied to Clipboard" "Feel free to paste it." -i "$1"
    fi
}

upload_screenshot() {
    if [ -f "$1" ]; then
        # Tentando fazer o upload da imagem
        UPLOAD_LINK=$(curl -s -F "file=@\"$1\"" https://0x0.st)
        if [ ! -z "$UPLOAD_LINK" ]; then
            # Se o upload for bem-sucedido, copiar o link para o clipboard e mostrar a notificação
            echo "$UPLOAD_LINK" | wl-copy  # Copiar o link do upload para o clipboard
            notify-send --expire-time=3000 --category=screenshot --icon="document-send" "Screenshot Upload Successful" "The link to your screenshot has been copied to clipboard!"
            return 0
        else
            echo "Upload failed."
            return 1
        fi
    fi
}

make_screenshot "$1" "$SCREENSHOT_FULLNAME"

if [ ! -f "$SCREENSHOT_FULLNAME" ]; then
    exit;
fi

case "$2" in
    upload)
        # Se a opção de upload for escolhida, tentar o upload da imagem
        upload_screenshot "$SCREENSHOT_FULLNAME"
        ;;
    *)
        # Caso contrário, copiar a captura para o clipboard diretamente
        copy_to_clipboard "$SCREENSHOT_FULLNAME"
        show_message "$SCREENSHOT_FULLNAME" document-save "Screenshot image"
        ;;
esac
