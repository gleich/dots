function gpg_fix --description 'Hard reset GnuPG permissions/locks and verify signing works'
    set -l GNUPGHOME (gpgconf --list-dirs homedir)
    echo "GNUPGHOME=$GNUPGHOME"

    echo "→ Stopping all GnuPG processes"
    gpgconf --kill all 2>/dev/null; or true
    pkill -9 gpg-agent 2>/dev/null; or true
    pkill -9 keyboxd 2>/dev/null; or true
    pkill -9 dirmngr 2>/dev/null; or true
    pkill -9 gpg 2>/dev/null; or true

    echo "→ Fixing ownership"
    sudo chown -R "$USER:staff" "$GNUPGHOME"; or begin
        echo "✗ Failed to chown $GNUPGHOME"
        return 1
    end

    echo "→ Fixing permissions"
    chmod 700 "$GNUPGHOME"; or true
    if test -d "$GNUPGHOME/public-keys.d"
        chmod 700 "$GNUPGHOME/public-keys.d"; or true
    end

    # Ensure dirs are searchable (x bit) and files are private
    find "$GNUPGHOME" -type d -exec chmod 700 {} \; 2>/dev/null; or true
    find "$GNUPGHOME" -type f -exec chmod 600 {} \; 2>/dev/null; or true

    echo "→ Removing stale locks and temp files"
    find "$GNUPGHOME" -name '*.lock' -delete 2>/dev/null; or true
    # Avoid fish globbing issues by deleting via find
    if test -d "$GNUPGHOME/public-keys.d"
        find "$GNUPGHOME/public-keys.d" -name '.#lk*' -delete 2>/dev/null; or true
    end

    echo "→ Restarting agent and testing signing"
    gpgconf --kill all 2>/dev/null; or true
    echo test | gpg --clearsign >/dev/null 2>&1
    set -l exit_code $status

    if test $exit_code -eq 0
        echo "✓ GPG signing test OK (exit $exit_code)"
        return 0
    else
        echo "✗ GPG signing test FAILED (exit $exit_code)"
        echo "  Try: gpg --version; gpg -K; and check: ls -ldeO $GNUPGHOME $GNUPGHOME/public-keys.d"
        return $exit_code
    end
end
