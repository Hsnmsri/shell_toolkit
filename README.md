# Shell Toolkit
This repository contains a collection of commonly used .cmd and .sh scripts for Windows and Linux, designed to simplify and automate routine tasks. Ideal for developers and system administrators looking to streamline their workflows.

## ping4.cmd
This script pings an IP address or domain name a specified number of times, allowing for repeated pings or exit.

- set ping count 
```bash
domain/ip -n 6
```

## nslookup.cmd
This tool is a simple batch script that enables you to search for DNS records for a domain on your system. By entering the desired domain name, it executes the nslookup tool to retrieve DNS information. Additionally, it allows you to change your system's DNS settings so that you can set the DNS servers to a specific value before running nslookup, and then revert the DNS settings to their initial state after completing the nslookup operation. This capability enables you to examine DNS information for different domains more precisely and experimentally utilize various DNS servers.