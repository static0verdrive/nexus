# Nexus

This project contains scripts for configuring [Sonatype Nexus 3](https://www.sonatype.com/products/repository-oss-download "Download Nexus OSS"), the incredible, open-source repository manager.

## Backgroud
Nexus acts as a repository for most modern IT needs. It can serve hosted or proxied repos for apt, docker, yum/dnf, nuget, pypi or even raw filesystems and more over http/https. The web GUI is intuitive, and administration can be done there easily or via POST messages and JSON.

## Interacting with Nexus
### Using the Rest API via curl
#### GET
Get your existing repos with the following curl command. In this case they are written to a file "repos.json", but note this file is missing some settings needed to create a repo using the POST method below.
`curl -u admin:<password> -X GET 'http://nexus:8081/service/rest/v1/repositories' -o repos.json`


#### POST
Create repos with the following curl commands. Note you target the `format` and `type` as part of the Rest API path with the hostname, e.g. an APT proxy *shown below*.
You need the -d with an @ sign to pass a json file, if you aren't providing it in quotes manually to curl. 

`curl -u admin:<password> -X POST "http://nexus:8081/service/rest/v1/repositories/apt/proxy" -H "Content-Type: application/json" -d @my-apt-repo.json`

### JSON
JSON files are used to configure Nexus repos[^note]. Here's an example of an APT proxy:
```json
{
  "name": "apt-repo",
  "online": true,
  "storage": {
    "blobStoreName": "default",
    "strictContentTypeValidation": true
  },
  "cleanup": {
    "policyNames": [
      "string"
    ]
  },
  "proxy": {
    "remoteUrl": "http://ca.archive.ubuntu.com/ubuntu/",
    "contentMaxAge": 1440,
    "metadataMaxAge": 1440
  },
  "negativeCache": {
    "enabled": true,
    "timeToLive": 1440
  },
  "httpClient": {
    "blocked": false,
    "autoBlock": true
  },
  "apt": {
    "distribution": "jammy",
    "flat": false
  }
}
```

[^note]:
    To see full, properly-formatted JSON you need to create a repo, you can navigate the web interface to the API section under System (in Administration).


## POST-repos.sh
This script will connect to the Nexus instance defined, with configured credentials (see top of script). 

### Usage
* Clone this git repo
* Edit the script to reflect your environment
* Run with: `bash POST-repos.sh`

## Help
https://community.sonatype.com/