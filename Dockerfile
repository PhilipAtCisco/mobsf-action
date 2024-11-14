FROM opensecurity/mobile-security-framework-mobsf:v4.1.3

LABEL version="1.7.2"
LABEL repository="https://github.com/fundacaocerti/mobsf-action"
LABEL homepage="https://github.com/fundacaocerti/mobsf-action"
LABEL maintainer="Ian Koerich Maciel <inm@certi.org.br>"

LABEL com.github.actions.name="GitHub Action for MobSF"
LABEL com.github.actions.description="Wraps the MobSF docker to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

USER github

RUN sudo apt-get update -y 
RUN sudo apt-get install -y curl jq
RUN sudo mkdir -p /github/home 
RUN sudo chown mobsf /github/home

USER mobsf
COPY LICENSE README.md /
COPY "entrypoint.sh" "/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"

ENTRYPOINT ["/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"]
CMD ["--help"]
