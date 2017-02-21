#!/usr/bin/env bash

resfile="./msh.etc"
funfile="./msh.fun"
lockfile="./.msh"
currlevel="1"
current=
currmenu="0"
choice=
title=
cmd=
redoflg=
dependflg=
status=
errmsg=
blank="          "

. $funfile

__showmenu(){
	clear

	prompt=`awk -F"\t" '$1 ~ /^PROMPT$/{print $2}' $resfile`

	if [ $1 = "0" ]
	then
		banner=`awk -F"\t" '$1 ~ /^BANNER$/{print $2}' $resfile`
		expression="\$1 ~ /^.\$/"
	else
		subbanner=`awk -F"\t" -v MENUID="$1" '{if($1==MENUID && $3=="submenu"){print $4}}' $resfile`
		if [ ! "X$subbanner" = "X" ]
		then
			banner=$subbanner
		fi
		expression="\$1 ~ /^$1-.\$/"
	fi

	$banner

	awk -F"\t" -v BLANK="$blank" -v ETCFILE="$lockfile" -v MENUID="$1" \
	'BEGIN{\
		while ( getline tracelog < ETCFILE == 1 ){\
			split(tracelog,menuid);\
			idstatus[menuid[1]]=menuid[2];\
		}\
	}\
	{ \
		if ('"$expression"'){ \
			if ($3!="submenu"){\
				sign="*";\
			}\
			else{\
				sign="";\
			}\
			if (idstatus[$1]=="OK"){\
				_status=" √";\
			}\
			else if (idstatus[$1]==""){\
				_status="";\
			}\
			else{\
				_status=" ✕";\
			}\
			print BLANK $1" "$2 sign _status; \
			lastid=$1;\
		} \
	}\
	END{\
		if ( idstatus[MENUID]=="" && idstatus[lastid]=="OK" ){\
			print MENUID "	OK" >> ETCFILE;
		}\
	}' $resfile

	printf "${blank}q quit\n"
	printf "    $prompt: "
}

__getfunc(){
	__i=0
	title=
	cmd=
	redoflg=
	dependflg=

	__line=`awk -F"\t" '{ if ($1 ~ /^'"$current"'$/)print $0 }' $resfile`
	for __p in ${__line// /}
	do
		__i=`expr $__i + 1`
		if [ $__i -eq 2 ] 
		then
			title=$__p
		elif [ $__i -eq 3 ] 
		then
			cmd=$__p
		elif [ $__i -eq 4 ] 
		then
			redoflg=$__p
		elif [ $__i -eq 5 ] 
		then
			dependflg=$__p
		fi
	done
}

submenu(){
	currlevel=`expr $currlevel + 1`
	currmenu="$current"
}

__upmenu(){

	currlevel=`expr $currlevel - 1`

	if [ "$currlevel" = "1" ]
	then
		currmenu="0"
	else
		__len=`expr $currlevel \* 2 - 3`
		currmenu=`printf "%."$__len"s" $currmenu`
	fi
}

__getcmd(){

	read choice

	if [ "X$choice" = "Xq" ]
	then
		if [ "X$currlevel" = "X1" ]
		then
			cmd="QUIT"
		else
			cmd="__upmenu"
		fi
	else
		if [ "X$currlevel" = "X1" ]
		then
			current=$choice
		else
			__len=`expr $currlevel \* 2 - 3`
			current=`printf "%."$__len"s" $current`"-$choice"
		fi
		__getfunc
	fi
}

__cmdcheck(){

	if [ "X$cmd" = "Xsubmenu" -o "X$cmd" = "X__upmenu" ]
	then
		return 1
	fi

	__statuslist=`awk -F"\t" -v depend=$dependflg '{if ($1 == depend)print $2}' $lockfile`
	__status=`echo $__statuslist | awk '{print $NF}'`

	if [ ! "X$dependflg" = "X" -a ! "X$__status" = "XOK" ]
	then
		errmsg=`echo "this step depends on [$dependflg] which is not executed or failed."`
		return 0
	fi

	__statuslist=`awk -F"\t" -v current=$current '{if ($1 == current)print $2}' $lockfile`
	__status=`echo $__statuslist | awk '{print $NF}'`

	if [ "X$redoflg" = "X0" -a "X$__status" = "XOK" ]
	then
		errmsg=`echo "this step can't be executed repeatly."`
		return 0
	fi

	return 1
}

__exec(){
	if [ ! "X$cmd" = "X" ]
	then
		__cmdcheck
		if [ $? -eq 1 ]
		then
			$cmd
			status=$?
			if [ $status -eq 0 ]
			then
				status="OK"
			fi

			if [ ! "X$cmd" = "Xsubmenu" -a ! "X$cmd" = "X__upmenu" ]
			then
				printf "%s	%s	%s\n" $current	$status	`date +%Y/%m/%d-%H:%M:%S` >> $lockfile
				echo "press ENTER to return."
				read __a
			fi
		else
			echo "$errmsg"
			read __a
		fi
	fi
}

if [ ! -f $lockfile ]
then
	> $lockfile
fi

while true
do

	__showmenu $currmenu

	__getcmd

	if [ "X$cmd" = "XQUIT" ]
	then
		printf "${blank}quit(y/n)?"
		read __ok
		if [ "X$__ok" = "Xy" ]
		then
			break
		else
			continue
		fi
	elif [ "X$cmd" = "XE" ]
	then
		continue
	else
		__exec
	fi

done

rm -f $lockfile
