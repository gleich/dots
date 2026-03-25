function ap
    git add -A
    set msg (git diff --staged | claude "write a conventional commit message for this diff, output only the commit message with no markdown or backticks" --print --model claude-haiku-4-5 --bare --no-session-persistence --tools "")
    echo "Committing: $msg"
    git commit -m $msg
    git push
end
