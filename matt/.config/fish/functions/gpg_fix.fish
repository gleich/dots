function gpg_fix --description 'Fix stuck GnuPG lock (bash steps); usage: gpg_fix <PID>'
    set -l pid $argv[1]
    if test -z "$pid"
        echo "usage: gpg_fix <PID>"
        return 2
    end

    # pass PID via env to avoid quoting hassles
    env LOCKPID="$pid" bash -lc '
        set -e

        rm -f ~/.gnupg/*.lock ~/.gnupg/openpgp-revocs.d/*.lock 2>/dev/null || true
        chmod 700 ~/.gnupg
        chmod 600 ~/.gnupg/* 2>/dev/null || true
        gpgconf --kill all || true

        unset GNUPGHOME
        GNUPGHOME="$(gpgconf --list-dirs homedir)"; echo "GNUPGHOME=$GNUPGHOME"

        ps -p ${LOCKPID} -o pid,comm,args || true
        kill ${LOCKPID} 2>/dev/null || true; sleep 1; kill -9 ${LOCKPID} 2>/dev/null || true

        gpgconf --kill all || true
        gpgconf --kill keyboxd 2>/dev/null || true
        gpg-connect-agent killagent /bye 2>/dev/null || true

        find "$GNUPGHOME" -type f -name "*.lock" -print -delete
        rm -f "$GNUPGHOME"/S.gpg-agent* "$GNUPGHOME"/S.dirmngr 2>/dev/null || true
        sudo chown -R "$USER" "$GNUPGHOME" || true
    '

    echo "GPG reset complete. Try your git commit again."
end
