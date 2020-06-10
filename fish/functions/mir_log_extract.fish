function mir_log_extract
    set GPG_ZIP $argv[1]
    set REQ_FILE $argv[2]
    set ZIP (basename $GPG_ZIP .gpg)
    set ZIP /tmp/"$ZIP"
    set FOLDER (basename $ZIP .zip)
    set FILEPATH (dirname (readlink -f $GPG_ZIP) )
    set FILENAME "$FILEPATH"/"$FOLDER"_"$REQ_FILE"

    set PASS "mir4zip"
    echo $PASS | gpg --homedir /tmp --batch --no-tty --yes --passphrase-fd 0 -o $ZIP $GPG_ZIP; and unzip -o $ZIP -d $FOLDER; and rm $ZIP
    cp "$FOLDER"/"$REQ_FILE" "$FILENAME"
    rm -r $FOLDER
end
