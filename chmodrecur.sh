#!/bin/bash
#for files
find ./*  -type f -exec chmod 0664 {} \;
#for directories
find ./*  -type d -exec chmod 0755 {} \;
