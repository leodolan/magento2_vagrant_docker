#!/bin/bash
# copy app code

 rsync -zrvh --delete /vagrant/html/app/code /opt/app/html/app
