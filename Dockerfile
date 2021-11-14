FROM python:3.9
RUN pip install --upgrade pip

RUN groupadd -r ynixon && useradd --no-log-init -r -g ynixon ynixon
USER ynixon
RUN pip3 install pylint pylint-report
WORKDIR /app

COPY --chown=ynixon:ynixon .pylintrc entrypoint.sh /app/
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
