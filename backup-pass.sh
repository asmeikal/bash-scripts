#!/bin/bash

tar -cz ~/.password-store | gpg --sign --encrypt -r "Michele Laurenti" > ~/password-store-backup.tar.gz.gpg
