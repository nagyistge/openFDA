FROM mysql:5.6.25

ADD db_init.sql /run.sh
RUN chmod 755 /run.sh

RUN mysql

CMD ["run.sh"]

