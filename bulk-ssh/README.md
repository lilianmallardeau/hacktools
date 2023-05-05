# bulk-ssh
A tool to try to bulk connect via SSH to a list of hosts with a list of usernames and passwords.
Every host/username/password combination will be tried.

Put the hosts to try to connect to in the `hosts.txt` file (ip addresses or hostnames, one host per line), and do the same for the usernames in `usernames.txt` and for the passwords in `passwords.txt`. 
Add a blank line at the end of each file otherwise the last line won't be read!

Then run:

```
./bulk-ssh.sh
```

If some credentials combinations happen to work, they will be listed in a `found_credentials.txt` file.
