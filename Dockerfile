FROM python:3.9
RUN pip3 install pylint pylint-report
COPY entrypoint.sh /
COPY .pylintrc /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
