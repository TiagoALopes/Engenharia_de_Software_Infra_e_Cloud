#Autor: Tiago André Lopes
#Email: tiago.lopes@aluno.faculdadeimpacta.com.br
#Disciplina: Infrastructure and Cloud Computing
#Aula 03: Subir dois contêineres, nginx e mysql, mapeando a porta 80 do nginx para acesso pelo host e permitir que o 
#contêiner do nginx tenha comunicação de rede no contêiner mysql. 

FROM  ubuntu:latest

LABEL "faculdade" "impacta"
LABEL "turma" "es22"

MAINTAINER tiago.andre.lopes@faculdade.impacta.com.br

RUN apt-get update && apt-get upgrade -y

EXPOSE 80