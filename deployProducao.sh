#!/bin/bash

# 1.rodar o build para gerar o arquivo .war;
mvn package

# 2.realizar o upload do WAR gerado para o servidor de producao;
scp build/war/AppNexxes-v2.4.war admin@nexxes.com.br:/tmp/AppNexxes.war

# 3.parar o tomcat;
ssh root@nexxes.com.br '/tomcat_home/bin/shutdown.sh'
ssh root@nexxes.com.br 'sleep 5'

# 4.apagar o war antigo do Tomcat;
ssh root@nexxes.com.br 'rm -rf /tomcat_home/webapps/AppNexxes' 
ssh root@nexxes.com.br 'rm -rf /tomcat_home/webapps/AppNexxes.war'

# 5.copiar o war novo para o Tomcat;
ssh root@nexxes.com.br 'cp AppNexxes.war /tomcat_home/webapps'

# 6.reiniciar o Tomcat:
ssh root@nexxes.com.br '/tomcat_home/bin/startup.sh'