#!/bin/bash

project=$1
year=`date +%Y`

cat <<EOF
${project}
Copyright (C) ${year} Michele Laurenti
email: asmeikal [at] me [dot] com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You can find a copy of the GNU General Public License at 
http://www.gnu.org/licenses/gpl.html
EOF


