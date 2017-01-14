:: 
:: Copyright (c) 2017 Jesse Nicholson.
:: 
:: Licensed under the Apache License, Version 2.0 (the "License");
:: you may not use this file except in compliance with the License.
:: You may obtain a copy of the License at
:: 
::     http://www.apache.org/licenses/LICENSE-2.0
:: 
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
:: See the License for the specific language governing permissions and
:: limitations under the License.
:: 

@echo off

:: Point this to the IKVMC.exe location if it's not in your path.
set IKVMC_BINARY=ikvmc

:: Just the version number. Example: 1.7.0
set APACHE_OPENNLP_VERSION=1.7.0

:: Checking to make sure that the required variables have been set, if 
:: not, jump to the end and warn the user that the script requires minor 
:: configuration.
if [%IKVMC_BINARY%] == [] GOTO RequiresSetup
if [%APACHE_OPENNLP_VERSION%] == [] GOTO RequiresSetup

:: Change to the lib directory.
cd ..\Lib\

ikvmc -sharedclassloader -target:library -assembly:OpenNLP.IKVM "opennlp-tools-%APACHE_OPENNLP_VERSION%.jar" "opennlp-uima-%APACHE_OPENNLP_VERSION%.jar"

cd ..\Scripts\

:: All Done.
exit /B

:: This will print out help information to the console to assist the 
:: user in correctly configuring the script in the event that the variables 
:: were not setup. 
:RequiresSetup
echo. & echo Please edit this batch file to have the following variables set correctly: & echo.
echo 	IKVMC_BINARY - Set this to the IKVMC.exe location if it's not in your path. & echo.
echo 	APACHE_OPENNLP_VERSION - Set this to the version number ONLY for which openNLP to build. & echo.
echo. & echo See script comments for more details.
timeout 10
exit /B