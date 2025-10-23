function sync_to_vm
                # --rsh "ssh -c aes128-ctr" \
    cd $HOME/work
    while sleep 0.1;
        find . type f -print | watchexec --clear --restart --postpone --timings '\
            date && \
            rsync \
                -avzP \
                --human-readable \
                --delete \
                --partial-dir /tmp/rsync_partial \
                --exclude-from="/Users/stpi/work/rsync-exclude-file.txt" \
                $HOME/work/ \
                rsync://stpi.sdma.nzcorp.net/work \
            || \
            ssh stpi "rm -rf /tmp/rsync_partial/*" && \
            date';
        # rg --no-ignore --hidden -l . | entr -scpr 'rsync -avzP --delete --exclude-from="/Users/stpi/work/rsync-exclude-file.txt" $HOME/work/ stpi:/work';
    end
end
