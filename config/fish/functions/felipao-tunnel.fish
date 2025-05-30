function felipao-tunnel --wraps='ssh -D xxxx -p xxx -fN felipe@xxx.xxx.xxx.xx' --description 'alias felipao-tunnel=ssh -D xxxx -p xxx -fN felipe@xxx.xxx.xxx.xx'
  ssh -D 1080 -p 443 -fN felipe@xxx.xxx.xxx.xx $argv
        
end
