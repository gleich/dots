function conf
	cd ~/.config/$argv
end

function ccat
	cat $argv | pbcopy
end

function backup_remarkable
    cd "/Users/matt/Library/Mobile Documents/com~apple~CloudDocs/Important/exports"
    cd remarkable
    scp -r root@10.11.99.1:/home/root/.local/share/remarkable/xochitl "remarkable-$(date -I)"
end
