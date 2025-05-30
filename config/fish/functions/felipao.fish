function felipao --wraps='clear; ssh felipe@xxx.xxx.xxx.xx' --description 'alias felipao=clear; ssh felipe@xxx.xxx.xxx.xx'
    clear
    ssh -p 22 felipe@xxx.xxx.xxx.xx $argv

end
