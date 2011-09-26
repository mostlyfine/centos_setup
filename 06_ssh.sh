#!/bin/sh

mkdir ~/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsblJsnvO8uSp+aBuDj4FZSrBZm/nwEWYy0OxKOpuavKItx+mmAT0+JOB2EGmI2XIacTYU2hU6Hc/KcxFJExSIcQ+bZq2dZaNuR54ShLMLUY6bWxPm94sCGJ5MKuSk+DyfDlUKhIBqYYGPhd7yRnOvxndpHrYmVsDP3IFR/wdlq0/6+0SVQXwiSMbETW78UcXWvesmzB8UjT+gw+jvBmlq/2YisGue4Rug26qAqyTB0wFqzKehig25YFvS3TqnWJjJ9XOdRqszQCxa0qniiUiIdhPKHzSzxerM427o/FU+2Mr7oJ8cbU+ijiuHAd9kT2VqHY7RepnPJ4LYWb4DRWhDw== sawa@ubuntu" > ~/.ssh/authorized_keys


chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
