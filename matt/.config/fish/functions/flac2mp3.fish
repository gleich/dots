function flac2mp3 --description 'Convert .flac -> MP3 into ./mp3, copying metadata + embedded cover art when present'
    if not command -q ffmpeg
        echo "ffmpeg not found. Install it: brew install ffmpeg"
        return 127
    end

    mkdir -p mp3

    set -l converted 0
    for f in *.flac
        if test "$f" = "*.flac"
            echo "No .flac files found in (pwd)."
            return 1
        end

        set -l out "mp3/"(string replace -r '\.flac$' '' -- "$f")".mp3"

        ffmpeg -hide_banner -nostdin -y \
            -i "$f" \
            -map 0:a -map 0:v? \
            -map_metadata 0 \
            -c:a libmp3lame -q:a 2 \
            -c:v copy \
            -disposition:v:0 attached_pic \
            -id3v2_version 3 -write_id3v1 1 \
            "$out"

        if test $status -ne 0
            echo "Failed converting: $f"
            return 1
        end

        set converted (math $converted + 1)
    end

    echo "Converted $converted file(s) into ./mp3/"
end
