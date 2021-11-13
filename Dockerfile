FROM python:3
RUN pip3 install pylint pylint-report
RUN python --version ; pip --version ; pylint --version
COPY entrypoint.sh /
COPY .pylintrc /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
