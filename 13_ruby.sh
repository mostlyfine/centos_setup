#!/bin/sh

echo "install ruby 1.9.2"

wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz
tar xvzf ruby-1.9.2-p290.tar.gz
cd ruby-1.9.2-p290
./configure
make && make install
ln -s /usr/local/bin/ruby /usr/bin/ruby

echo "install zlib for mysql"

cd ext/zlib
yum install -y zlib-devel
ruby extconf.rb
make
make install

echo "install rubygems"

cd ../../..
wget http://rubyforge.org/frs/download.php/75309/rubygems-1.8.10.tgz
tar xvzf rubygems-1.8.10.tgz
cd rubygems-1.8.10
ruby setup.rb

gem source -a http://gems.github.com/
gem source -a http://gems.rubyfouge.org/
