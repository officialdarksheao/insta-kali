# insta-kali
Dockerfile for building kali machine for quick tasks
Including powershell profile functions and alias definitions
Notes:
* Replace `{yourUsername}` with your docker username, if you are not using dockerhub then you may enter whatever you like.
* Replace `{pathToThisRepo}` with where you checked this repo out to

# Requirements
* docker

# Building
`docker build . --tag {yourUsername}\insta-kali:latest`

# Usage
`docker run -v ${pwd}:/opt/volume -t -i {yourUsername}\insta-kali:latest /bin/bash`

# Powershell
Add the following to your powershell profile to use commands "fresh" and "kali", to build fresh version of the base image or to spin up the disposable box.
```
Function BuildFreshKali {
    Set-Location -Path {pathToThisRepo}
    docker build . -t {yourUsername}\insta-kali:latest
}
Set-Alias -Name fresh -Value BuildFreshKali

Function StartKaliMachineThroughDocker {
    $current = Get-Location
    docker run -v ${current}:/opt/volume -t -i {yourUsername}\insta-kali:latest /bin/bash
}
Set-Alias -Name kali -Value StartKaliMachineThroughDocker
```
