FROM flyway/flyway:6.3

USER root
RUN apt update && apt install unzip

# Terraform 0.11
ADD https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip /usr/local/bin
RUN unzip /usr/local/bin/terraform_0.11.14_linux_amd64.zip -d /usr/local/bin/ && rm /usr/local/bin/terraform_0.11.14_linux_amd64.zip

# Cloudsql proxy
ADD https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 /usr/local/bin
RUN mv /usr/local/bin/cloud_sql_proxy.linux.amd64 /usr/local/bin/cloud-sql-proxy && chmod +x /usr/local/bin/cloud-sql-proxy

USER flyway
