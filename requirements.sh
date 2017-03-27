git clone https://$GITHUB_TOKEN@github.com/datacamp/courses-intro-to-sql.git

service postgresql start \
  && sudo -u postgres createdb -O repl films \
  && sudo -u postgres createdb -O repl olympics \
  && cd courses-intro-to-sql \
  && sudo -u postgres psql films < data/films/films.sql \
  && sudo -u postgres psql olympics < data/olympics/code/olympics.sql \
  && service postgresql stop

