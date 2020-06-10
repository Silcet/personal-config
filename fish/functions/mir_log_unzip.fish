function mir_log_unzip
    set GPG_ZIP $argv[1]
    set ZIP (basename $GPG_ZIP .gpg)

    if test (count $argv) -le 1
        set FOLDER (basename $ZIP .zip)
    else
        set FOLDER $argv[2]
    end
    
    set PASS "mir4zip"
    echo $PASS | gpg --homedir /tmp --batch --no-tty --yes --passphrase-fd 0 -o $ZIP $GPG_ZIP; and unzip -o $ZIP -d $FOLDER; and rm $ZIP
end
        
