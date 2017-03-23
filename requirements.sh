git clone https://$GH_TOKEN@github.com/datacamp/courses-intro-to-sql.git

service postgresql start \
  && sudo -u postgres createdb -O repl films \
  && cd courses-intro-to-sql \
  && sudo -u postgres psql films < data/films/code/films.sql \
  && service postgresql stop

