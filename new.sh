#!/bin/bash

set -ue

normalize()
{
    awk -F',' "
        {
            sub(/^.*: /, \"\");
            sub(/^\[/, \"\");
            sub(/\]$/, \"\");
            gsub(/[\"' ]/, \"\");
        }
        
        NF > 0 {
            for (i=1; i<=NF; i++) {
                print \$i;
            }
        }" | tr '[:upper:]' '[:lower:]' | sort -u
}

usage()
{
    echo
    echo "`basename "$0"` \"some title\""
    echo
    echo "    -h --help"
    echo "    --date=1983-01-18"
    echo "    --tags=tag1,tag2"
    echo "    --category=cat1"
    echo
    echo "Existing categories:" `grep '^category: ' -r _posts/ | normalize`
    echo "Existing tags:" `grep '^tags: ' -r _posts/ | normalize`
}

error()
{
    fmt="$1"
    shift
    printf "ERROR: $fmt\n" "$@" >&2
}

set_once()
{
    varname=$1
    value=$2

    read -r -d '' check <<EOF || true
        if [ ! -z "\$$varname" ]; then
            error "$varname specified twice: \"%s\", then \"%s\"" "\$$varname" "\$value"
            exit 1
        fi
        $varname="\$value"
EOF

    eval "$check"
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi

cmd="rake post" # title=\"$1\" [date="2012-02-09"] [tags=[tag1,tag2]] [category="category"]

title=""
date=""
tags=""
category=""
while [ $# -gt 0 ]; do
    param=`echo $1 | awk -F= '{print $1}'`
    value=`echo $1 | awk -F= '{print $2}'`
    case $param in
        -h | --help)
            usage
            exit 1
            ;;
        --date)
            set_once date "$value"
            ;;
        --tags)
            set_once tags "[$value]"
            ;;
        --category)
            set_once category "$value"
            ;;
        --*)
            error "unknown parameter %s" "$param"
            usage
            exit 1
            ;;
        *)
            set_once title "$param"
            ;;
    esac
    shift
done

if [ -z "$date" ]; then
    set_once date `date +%Y-%m-%d`
fi

rake post title="$title" date="$date" category="$category" tags="$tags"
