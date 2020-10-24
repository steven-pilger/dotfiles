#!/bin/bash

# if bw_session not set then unlock and set
if [ -z ${BW_SESSION+x} ]; then
	echo "var is unset";
	echo 'unlocking....'
	key=$(bw unlock --raw)
	export BW_SESSION=$key
# if it is already set, try to unlock with bw_session as key
else
	echo "var is set to '$BW_SESSION'";
	lock_msg=$(bw unlock --session $BW_SESSION --check 2>&1)
	echo $lock_msg
	# if still locked because bw_session expired then unlock
	if [[ $lock_msg == *"locked."* ]]; then
		echo 'unlocking....'
		key=$(bw unlock --raw)
		export BW_SESSION=$key
	fi
fi


bw get item \
	$(\
		bw list items |\
		jq 'map(.name + "___" + .id)' |\
		fzf |\
		rg -o '___(.*)"' -r '$1'\
	) |\
	jq '.login.password' |\
	rg -o '"(.*)"' -r '$1' |\
	pbcopy
