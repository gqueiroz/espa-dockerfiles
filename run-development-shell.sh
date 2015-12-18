# The image/container to run against
if [ $1 ]; then
    image=$1
    the_gid=''
    the_uid=''
else
    image="usgs-espa/ubuntu-development"

    # These solve file creation problems for developers
    # The group ID of the person kicking off the container
    the_gid=`id -g`
    # The group ID of the person kicking off the container
    the_uid=`id -u`
fi

# Create the head of the command
cmd_head="docker run -i"
cmd_tail="-t ${image} ${the_gid} ${the_uid}"

# If this file exists, then use it for mounting source code volumes that will
# override the defaulted versions
# NOTE - You will have to compile and install these, before they will override
#        during processing.
if [ -f use-these-science-apps.sh ]; then
    . use-these-science-apps.sh
fi

# Create the tail of the command, specifying the image and the user and group
# IDs to run as in the container for file creation problems
cmd=${cmd_head}" "${cmd_tail}

# Let the user know what we are doing, and then execute the command
echo $cmd
$cmd