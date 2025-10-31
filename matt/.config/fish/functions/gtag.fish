function gtag --description 'Run git tag and push the tag to origin'
    set tag $argv[1]
    git tag -a $tag -m $tag
    git push origin $tag
end
