@echo off

IF "%1"=="" GOTO :USAGE
IF "%1"=="deploy" @cd %WORKSPACE%/pass/platform/runtime/deployment

IF "%1"=="pass" @cd %WORKSPACE%/pass 

IF "%1"=="platform" @cd %WORKSPACE%/pass/platform 

IF "%1"=="tomcat" @cd %WORKSPACE%/pass/platform/runtime/deployment/platform-deployer/target/apache-tomcat

IF "%1"=="lookup" @cd %WORKSPACE%/pass/platform/runtime/deployment/platform-deployer/target/apache-tomcat/conf/lookup

IF "%1"=="automation" @cd %WORKSPACE%/pass/automation
IF "%1"=="accrun" @cd %WORKSPACE%/pass/automation/automation-run
IF "%1"=="acctest" @cd %WORKSPACE%/pass/automation/automation-tests

IF "%1"=="core" @cd %WORKSPACE%/pass/platform/core

IF "%1"=="runtime" @cd %WORKSPACE%/pass/platform/runtime

IF "%1"=="service" @cd %WORKSPACE%/pass/platform/service

IF "%1"=="webapp" @cd %WORKSPACE%/pass/platform/runtime/platform-webapp

IF "%1"=="frs" @cd %WORKSPACE%/pass/platform/services/file-repository

IF "%1"=="mm" @cd %WORKSPACE%/pass/platform/core/monitoring-metering

IF "%1"=="ana" @cd %WORKSPACE%/pass/platform/analytics


@goto :eof


:USAGE
@echo usage:
@echo           f deploy
@echo           f pass
@echo           f platform
@echo           f lookup
@echo           f tomcat
@echo           f automation
@echo           f accrun
@echo           f acctest
@echo           f runtime
@echo           f service
@echo           f webapp
@echo           f ana
