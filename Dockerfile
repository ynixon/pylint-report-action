FROM python:3.9

RUN groupadd -r appuser && useradd --no-log-init -r -g appuser appuser
RUN chown -R appuser:appuser /home/ && chmod -R 0700 /home/
USER appuser
RUN pip install --upgrade pip
RUN pip3 install pylint pylint-report
WORKDIR /app

COPY --chown=appuser:appuser .pylintrc entrypoint.sh /app/
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
