FROM jenkins/jenkins:jdk11-hotspot-windowsservercore-2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# ltsc2019+ no tiene fuentes integradas, chrome las necesita para funcionar correctamente (https://github.com/gantrior/docker-chrome-windows)
ADD files/fonts.tar /Fonts/
WORKDIR /Fonts/
RUN .\Add-Font.ps1 Fonts
WORKDIR /

# choco
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# chrome
RUN choco install googlechrome -y

# git
RUN choco install git -y

# java 20
RUN choco install openjdk -y

# vim
RUN choco install vim -y


