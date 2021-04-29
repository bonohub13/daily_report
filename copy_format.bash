#!/usr/bin/bash
DATE=`LANG="en_US.UTF-8" date | sed -r "s/[^ ]+ +([^ ]+)+ +([^ ]+)+ +[^ ]+ +[^ ]+ +[^ ]+ +([^ ]+)+/\3\1\2/"`

# directory you want to store your daily reports
## $HOME/Documents is the path set by default.
## If you want something different feel free to change it to whatever you'd like
SOURCE_PATH="/home/kensuke/Documents/.ats/training/daily_report"

if [[ ! -d ${SOURCE_PATH} ]] || [[ ${SOURCE_PATH} = "NULL" ]]; then
    echo "ERROR: SOURCE_PATH not set to valid directory path"
    echo "Set \$SOURCE_PATH to the path of the directory where \"daily_report\" is"
    echo "Example) SOURCE_PATH=/home/user/daily_report"
fi

FILE_PATH="/home/kensuke/Documents/.ats/training/daily_report"

# create new directory if it doesn't exist
init_filepath()
{
    if [[ ! -d $1 ]]; then
        echo "Making new directory at $1 ..."
        mkdir -p $1
        if [[ -d $1 ]]; then
            echo "New directory made!"
        fi
    fi
}

# get date of month in MMDD
get_month()
{
    MON=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
    MON_NUM=("01" "02" "03" "04" "05" "06" "06" "07" "08" "09" "10" "11" "12")

    for i in `seq 0 11`; do
        if [ "$(echo $1 | grep -i ${MON[${i}]})" != "" ]; then
            output=`echo $1 | sed "s/${MON[$i]}/${MON_NUM[$i]}/"`
        fi
    done

    echo "${output}"
}

# main function
main()
{
    init_filepath $2
    DATE=`get_month $1`
    FILENAME="$DATE.md"
    sed "s/年月日/${DATE:0:4}年${DATE:4:2}月${DATE:6:2}日/" $SOURCE_PATH/format.md | tee $2/$FILENAME
}

main $DATE $FILE_PATH

