function sync_to_vm
    cd $HOME/work
    while sleep 0.1;
        rg --no-ignore --hidden -l . | watchexec --clear --restart --postpone --timings '\
            rsync \
                --rsh "ssh -c aes128-ctr" \
                -avzP \
                --human-readable \
                --delete \
                --partial-dir /tmp/rsync_partial \
                --exclude-from="/Users/stpi/work/rsync-exclude-file.txt" \
                $HOME/work/ \
                stpi:/work \
            || \
            ssh stpi "rm -rf /tmp/rsync_partial/*" && \
            date';
        # rg --no-ignore --hidden -l . | entr -scpr 'rsync -avzP --delete --exclude-from="/Users/stpi/work/rsync-exclude-file.txt" $HOME/work/ stpi:/work';
    end
end
