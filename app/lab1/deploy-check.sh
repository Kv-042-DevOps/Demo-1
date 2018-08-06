#/usb/bin/env bash
#
# This scropt wil prepeare file settings.py to deploy


FILED="settings.py.deploy"

cp settings.py $FILED

#
# The Secret key must be kept secret
#
# Save secret key to file


grep "^SECRET_KEY" $1 | sed 's/[[:space:]]//g' > secret_key.txt

# Set env SECRET_KEY
sed -i "s/SECRET_KEY/export SECRET_KEY/g" secret_key.txt 

source secret_key.txt

# Check env

if [ -n $SECRET_KEY ]; then
	echo "SECRET_KEY SET SUCCESS"
	echo $SECRET_KEY
else 
	echo "SECRET_KEY NOT SET"
	exit 1
fi

# new schema load SECRET_KEY save file $FILED

sed -i "/SECRET_KEY/c\ \nif \"SECRET_KEY\" in os.environ:\n\t SECRET_KEY=os.environ['SECRET_KEY']\nelse:\n\twith open('/etc/secret_key.txt') as f:\n\tSECRET_KEY = f.read().strip()\n" $FILED

# Change Debug mode

sed -i "/DEBUG/c\DEBUG = False" $FILED

# set hostname

echo $HOSTNAME

sed -i "/ALLOWED_HOSTS/c\ALLOWED_HOSTS = [$HOSTNAME]" $FILED




