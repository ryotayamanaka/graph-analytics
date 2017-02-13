@ECHO OFF
SET MY_DIR=%~dp0
SET CLASSPATH=%MY_DIR%..\shared-memory\common\*
SET CLASSPATH=%CLASSPATH%;%MY_DIR%..\shared-memory\embedded\*
SET CLASSPATH=%CLASSPATH%;%MY_DIR%..\shared-memory\client\*
SET CLASSPATH=%CLASSPATH%;%MY_DIR%..\shared-memory\third-party\*
java oracle.pgx.shell.Console %*
