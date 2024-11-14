FROM opensecurity/mobile-security-framework-mobsf:v4.1.3

LABEL version="1.7.2"
LABEL repository="https://github.com/fundacaocerti/mobsf-action"
LABEL homepage="https://github.com/fundacaocerti/mobsf-action"
LABEL maintainer="Ian Koerich Maciel <inm@certi.org.br>"

LABEL com.github.actions.name="GitHub Action for MobSF"
LABEL com.github.actions.description="Wraps the MobSF docker to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

USER root

RUN apt-get update -y 
RUN apt-get install -y curl jq
#RUN mkdir -p /github/home/.MobSF
#RUN ls -ld /github
#RUN ls -ld /github/home
#RUN ls -ld /github/home/.MobSF
#RUN chown mobsf /github/home/.MobSF
#RUN ls -ld /github/home/.MobSF
#RUN chmod 700 /github/home/.MobSF
#RUN ls -ld /github/home/.MobSF

ENV MOBSF_HOME_DIR=/home/mobsf/.MobSF

USER mobsf
COPY LICENSE README.md /
COPY "entrypoint.sh" "/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"

ENTRYPOINT ["/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"]
CMD ["--help"]
